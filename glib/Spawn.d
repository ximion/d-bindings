/*
 * Licensed under the GNU Lesser General Public License Version 3
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the license, or
 * (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

// generated automatically - do not change


module glib.Spawn;

private import core.stdc.stdio;
private import core.stdc.string;
private import core.thread;
private import gi.glib;
public  import gi.glibtypes;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import std.string;


/** */
public class Spawn
{
	//we need fdopen.
	version(Posix)
	{
		private import core.sys.posix.stdio;
	}
	//fdopen for Windows is defined in gi.glibtypes.
	
	string workingDirectory = ".";
	string[] argv;
	string[] envp;
	GSpawnFlags flags = SpawnFlags.SEARCH_PATH;
	GSpawnChildSetupFunc childSetup;
	void* userData;
	GPid childPid;
	FILE* standardInput;
	FILE* standardOutput;
	FILE* standardError;
	GError* error;
	int stdIn;
	int stdOut;
	int stdErr;
	
	// for commandLineSync
	int exitStatus;
	char* strOutput;
	char* strError;
	
	alias bool delegate(Spawn) ChildWatch;
	ChildWatch externalWatch;
	
	/**
	 * Creates a Spawn for execution.
	 */
	public this(string program, string[] envp=null)
	{
		argv ~= program;
		this.envp = envp;
	}
	
	/**
	 * Creates a Spawn for execution.
	 */
	public this(string[] program, string[] envp=null)
	{
		argv = program;
		this.envp = envp;
	}
	
	/**
	 * Adds a delegate to be notified on the end of the child process.
	 * Params:
	 *    	dlg =
	 */
	public void addChildWatch(ChildWatch dlg)
	{
		externalWatch = dlg;
	}
	
	/**
	 * Closes all open streams and child process.
	 */
	public void close()
	{
		if (stdIn != 0 )
		{
			fclose(standardInput);
			stdIn = 0;
		}
		if (stdOut != 0 )
		{
			fclose(standardOutput);
			stdOut = 0;
		}
		if (stdErr != 0 )
		{
			fclose(standardError);
			stdErr = 0;
		}
		if ( childPid != 0 )
		{
			closePid(childPid);
			childPid = 0;
		}
	}
	
	/**
	 * Adds a parameter to the execution program
	 */
	public void addParm(string parm)
	{
		argv ~= parm;
	}
	
	/**
	 * Gets the last error message
	 */
	public string getLastError()
	{
		if ( error != null )
		{
			return Str.toString(error.message);
		}
		return "";
	}
	
	/**
	 * Executes the prepared process
	 */
	public int execAsyncWithPipes(
		ChildWatch externalWatch = null,
		bool delegate(string) readOutput = null,
	bool delegate(string) readError = null )
	{
		int result = g_spawn_async_with_pipes(
			Str.toStringz(workingDirectory),
			Str.toStringzArray(argv),
			Str.toStringzArray(envp),
			flags,
			childSetup,
			userData,
			&childPid,
			&stdIn,
			&stdOut,
			&stdErr,
			&error
		);
		
		if ( result != 0 )
		{
			this.externalWatch = externalWatch;
			g_child_watch_add(childPid, cast(GChildWatchFunc)(&childWatchCallback), cast(void*)this);
			standardInput = fdopen(stdIn, Str.toStringz("w"));
			standardOutput = fdopen(stdOut, Str.toStringz("r"));
			standardError = fdopen(stdErr, Str.toStringz("r"));
			
			if ( readOutput !is null )
			{
				(new ReadFile(standardOutput, readOutput)).start();
			}
			if ( readError !is null )
			{
				(new ReadFile(standardError, readError)).start();
			}
		}
		
		return result;
	}
	
	class ReadFile : Thread
	{
		bool delegate(string) read;
		FILE* file;
		
		int lineCount;
		
		this(FILE* file, bool delegate (string) read )
		{
			this.file = file;
			this.read = read;
			
			super(&run);
		}
		
		public void run()
		{
			string line = readLine(file);
			while( line !is null )
			{
				++lineCount;
				if ( read !is null )
				{
					read(line);
				}
				line = readLine(file);
			}
		}
	}
	
	private string readLine(FILE* stream, int max=4096)
	{
		if ( feof(stream) )
		{
			if ( externalWatch !is null )
			{
				externalWatch(this);
			}
			return null;
		}
		string line;
		line.length = max+1;
		char* lineP = fgets(Str.toStringz(line), max, stream);
		if ( lineP is null )
		{
			return "";
		}
		size_t l = strlen(line.ptr);
		if ( l > 0 ) --l;
		
		return line[0..l];
	}
	
	extern(C) static void childWatchCallback(int pid, int status, Spawn spawn)
	{
		//writefln("Spawn.childWatchCallback %s %s", pid, status);
		spawn.exitStatus = status;
		if ( spawn.externalWatch !is null )
		{
			spawn.externalWatch(spawn);
		}
		spawn.close();
	}
	
	
	public bool endOfOutput()
	{
		if ( standardOutput is null ) return true;
		return feof(standardOutput) != 0;
	}
	
	public bool endOfError()
	{
		if ( standardError is null ) return true;
		return feof(standardError) != 0;
	}
	
	string getOutputString()
	{
		return Str.toString(strOutput);
	}
	
	string getErrorString()
	{
		return Str.toString(strError);
	}
	
	int getExitStatus()
	{
		return exitStatus;
	}
	
	/**
	 * Executes a command synchronasly and
	 * optionally calls delegates for sysout, syserr and end of job
	 *
	 */
	public int commandLineSync(
		ChildWatch externalWatch = null,
		bool delegate(string) readOutput = null,
	bool delegate(string) readError = null )
	{
		string commandLine;
		foreach ( int count, string arg; argv)
		{
			if ( count > 0 )
			{
				commandLine ~= ' ';
			}
			commandLine ~= arg;
		}
		int status = g_spawn_command_line_sync(
			Str.toStringz(commandLine),
			&strOutput,
			&strError,
			&exitStatus,
			&error);
		if ( readOutput != null )
		{
			foreach ( string line ; splitLines(Str.toString(strOutput)) )
			{
				readOutput(line);
			}
		}
		if ( readError != null )
		{
			foreach ( string line ; splitLines(Str.toString(strError)) )
			{
				readError(line);
			}
		}
		if ( externalWatch != null )
		{
			externalWatch(this);
		}
		return status;
	}

	/**
	 */

	/**
	 * See g_spawn_async_with_pipes() for a full description; this function
	 * simply calls the g_spawn_async_with_pipes() without any pipes.
	 *
	 * You should call g_spawn_close_pid() on the returned child process
	 * reference when you don't need it any more.
	 *
	 * If you are writing a GTK+ application, and the program you are
	 * spawning is a graphical application, too, then you may want to
	 * use gdk_spawn_on_screen() instead to ensure that the spawned program
	 * opens its windows on the right screen.
	 *
	 * Note that the returned @child_pid on Windows is a handle to the child
	 * process and not its identifier. Process handles and process identifiers
	 * are different concepts on Windows.
	 *
	 * Params:
	 *     workingDirectory = child's current working directory, or %NULL to inherit parent's
	 *     argv = child's argument vector
	 *     envp = child's environment, or %NULL to inherit parent's
	 *     flags = flags from #GSpawnFlags
	 *     childSetup = function to run in the child just before exec()
	 *     userData = user data for @child_setup
	 *     childPid = return location for child process reference, or %NULL
	 *
	 * Return: %TRUE on success, %FALSE if error is set
	 *
	 * Throws: GException on failure.
	 */
	public static bool async(string workingDirectory, string[] argv, string[] envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, out GPid childPid)
	{
		GError* err = null;
		
		auto p = g_spawn_async(Str.toStringz(workingDirectory), Str.toStringzArray(argv), Str.toStringzArray(envp), flags, childSetup, userData, &childPid, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Set @error if @exit_status indicates the child exited abnormally
	 * (e.g. with a nonzero exit code, or via a fatal signal).
	 *
	 * The g_spawn_sync() and g_child_watch_add() family of APIs return an
	 * exit status for subprocesses encoded in a platform-specific way.
	 * On Unix, this is guaranteed to be in the same format waitpid() returns,
	 * and on Windows it is guaranteed to be the result of GetExitCodeProcess().
	 *
	 * Prior to the introduction of this function in GLib 2.34, interpreting
	 * @exit_status required use of platform-specific APIs, which is problematic
	 * for software using GLib as a cross-platform layer.
	 *
	 * Additionally, many programs simply want to determine whether or not
	 * the child exited successfully, and either propagate a #GError or
	 * print a message to standard error. In that common case, this function
	 * can be used. Note that the error message in @error will contain
	 * human-readable information about the exit status.
	 *
	 * The @domain and @code of @error have special semantics in the case
	 * where the process has an "exit code", as opposed to being killed by
	 * a signal. On Unix, this happens if WIFEXITED() would be true of
	 * @exit_status. On Windows, it is always the case.
	 *
	 * The special semantics are that the actual exit code will be the
	 * code set in @error, and the domain will be %G_SPAWN_EXIT_ERROR.
	 * This allows you to differentiate between different exit codes.
	 *
	 * If the process was terminated by some means other than an exit
	 * status, the domain will be %G_SPAWN_ERROR, and the code will be
	 * %G_SPAWN_ERROR_FAILED.
	 *
	 * This function just offers convenience; you can of course also check
	 * the available platform via a macro such as %G_OS_UNIX, and use
	 * WIFEXITED() and WEXITSTATUS() on @exit_status directly. Do not attempt
	 * to scan or parse the error message string; it may be translated and/or
	 * change in future versions of GLib.
	 *
	 * Params:
	 *     exitStatus = An exit code as returned from g_spawn_sync()
	 *
	 * Return: %TRUE if child exited successfully, %FALSE otherwise (and
	 *     @error will be set)
	 *
	 * Since: 2.34
	 *
	 * Throws: GException on failure.
	 */
	public static bool checkExitStatus(int exitStatus)
	{
		GError* err = null;
		
		auto p = g_spawn_check_exit_status(exitStatus, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * On some platforms, notably Windows, the #GPid type represents a resource
	 * which must be closed to prevent resource leaking. g_spawn_close_pid()
	 * is provided for this purpose. It should be used on all platforms, even
	 * though it doesn't do anything under UNIX.
	 *
	 * Params:
	 *     pid = The process reference to close
	 */
	public static void closePid(GPid pid)
	{
		g_spawn_close_pid(pid);
	}

	/**
	 * A simple version of g_spawn_async() that parses a command line with
	 * g_shell_parse_argv() and passes it to g_spawn_async(). Runs a
	 * command line in the background. Unlike g_spawn_async(), the
	 * %G_SPAWN_SEARCH_PATH flag is enabled, other flags are not. Note
	 * that %G_SPAWN_SEARCH_PATH can have security implications, so
	 * consider using g_spawn_async() directly if appropriate. Possible
	 * errors are those from g_shell_parse_argv() and g_spawn_async().
	 *
	 * The same concerns on Windows apply as for g_spawn_command_line_sync().
	 *
	 * Params:
	 *     commandLine = a command line
	 *
	 * Return: %TRUE on success, %FALSE if error is set
	 *
	 * Throws: GException on failure.
	 */
	public static bool commandLineAsync(string commandLine)
	{
		GError* err = null;
		
		auto p = g_spawn_command_line_async(Str.toStringz(commandLine), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * A simple version of g_spawn_sync() with little-used parameters
	 * removed, taking a command line instead of an argument vector.  See
	 * g_spawn_sync() for full details. @command_line will be parsed by
	 * g_shell_parse_argv(). Unlike g_spawn_sync(), the %G_SPAWN_SEARCH_PATH flag
	 * is enabled. Note that %G_SPAWN_SEARCH_PATH can have security
	 * implications, so consider using g_spawn_sync() directly if
	 * appropriate. Possible errors are those from g_spawn_sync() and those
	 * from g_shell_parse_argv().
	 *
	 * If @exit_status is non-%NULL, the platform-specific exit status of
	 * the child is stored there; see the documentation of
	 * g_spawn_check_exit_status() for how to use and interpret this.
	 *
	 * On Windows, please note the implications of g_shell_parse_argv()
	 * parsing @command_line. Parsing is done according to Unix shell rules, not
	 * Windows command interpreter rules.
	 * Space is a separator, and backslashes are
	 * special. Thus you cannot simply pass a @command_line containing
	 * canonical Windows paths, like "c:\\program files\\app\\app.exe", as
	 * the backslashes will be eaten, and the space will act as a
	 * separator. You need to enclose such paths with single quotes, like
	 * "'c:\\program files\\app\\app.exe' 'e:\\folder\\argument.txt'".
	 *
	 * Params:
	 *     commandLine = a command line
	 *     standardOutput = return location for child output
	 *     standardError = return location for child errors
	 *     exitStatus = return location for child exit status, as returned by waitpid()
	 *
	 * Return: %TRUE on success, %FALSE if an error was set
	 *
	 * Throws: GException on failure.
	 */
	public static bool commandLineSync(string commandLine, out string standardOutput, out string standardError, out int exitStatus)
	{
		char* outstandardOutput = null;
		char* outstandardError = null;
		GError* err = null;
		
		auto p = g_spawn_command_line_sync(Str.toStringz(commandLine), &outstandardOutput, &outstandardError, &exitStatus, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		standardOutput = Str.toString(outstandardOutput);
		standardError = Str.toString(outstandardError);
		
		return p;
	}

	/** */
	public static GQuark errorQuark()
	{
		return g_spawn_error_quark();
	}

	/** */
	public static GQuark exitErrorQuark()
	{
		return g_spawn_exit_error_quark();
	}

	/**
	 * Executes a child synchronously (waits for the child to exit before returning).
	 * All output from the child is stored in @standard_output and @standard_error,
	 * if those parameters are non-%NULL. Note that you must set the
	 * %G_SPAWN_STDOUT_TO_DEV_NULL and %G_SPAWN_STDERR_TO_DEV_NULL flags when
	 * passing %NULL for @standard_output and @standard_error.
	 *
	 * If @exit_status is non-%NULL, the platform-specific exit status of
	 * the child is stored there; see the documentation of
	 * g_spawn_check_exit_status() for how to use and interpret this.
	 * Note that it is invalid to pass %G_SPAWN_DO_NOT_REAP_CHILD in
	 * @flags.
	 *
	 * If an error occurs, no data is returned in @standard_output,
	 * @standard_error, or @exit_status.
	 *
	 * This function calls g_spawn_async_with_pipes() internally; see that
	 * function for full details on the other parameters and details on
	 * how these functions work on Windows.
	 *
	 * Params:
	 *     workingDirectory = child's current working directory, or %NULL to inherit parent's
	 *     argv = child's argument vector
	 *     envp = child's environment, or %NULL to inherit parent's
	 *     flags = flags from #GSpawnFlags
	 *     childSetup = function to run in the child just before exec()
	 *     userData = user data for @child_setup
	 *     standardOutput = return location for child output, or %NULL
	 *     standardError = return location for child error messages, or %NULL
	 *     exitStatus = return location for child exit status, as returned by waitpid(), or %NULL
	 *
	 * Return: %TRUE on success, %FALSE if an error was set
	 *
	 * Throws: GException on failure.
	 */
	public static bool sync(string workingDirectory, string[] argv, string[] envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, out string standardOutput, out string standardError, out int exitStatus)
	{
		char* outstandardOutput = null;
		char* outstandardError = null;
		GError* err = null;
		
		auto p = g_spawn_sync(Str.toStringz(workingDirectory), Str.toStringzArray(argv), Str.toStringzArray(envp), flags, childSetup, userData, &outstandardOutput, &outstandardError, &exitStatus, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		standardOutput = Str.toString(outstandardOutput);
		standardError = Str.toString(outstandardError);
		
		return p;
	}
}
