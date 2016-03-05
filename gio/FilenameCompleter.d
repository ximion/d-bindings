/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gio.FilenameCompleter;

private import gi.gio;
public  import gi.giotypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;


/**
 * Completes partial file and directory names given a partial string by
 * looking in the file system for clues. Can return a list of possible
 * completion strings for widget implementations.
 */
public class FilenameCompleter : ObjectG
{
	/** the main GObject struct */
	protected GFilenameCompleter* gFilenameCompleter;

	/** Get the main GObject struct */
	public GFilenameCompleter* getFilenameCompleterStruct()
	{
		return gFilenameCompleter;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFilenameCompleter;
	}

	protected override void setStruct(GObject* obj)
	{
		gFilenameCompleter = cast(GFilenameCompleter*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFilenameCompleter* gFilenameCompleter, bool ownedRef = false)
	{
		this.gFilenameCompleter = gFilenameCompleter;
		super(cast(GObject*)gFilenameCompleter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_filename_completer_get_type();
	}

	/**
	 * Creates a new filename completer.
	 *
	 * Return: a #GFilenameCompleter.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = g_filename_completer_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GFilenameCompleter*) p, true);
	}

	/**
	 * Obtains a completion for @initial_text from @completer.
	 *
	 * Params:
	 *     initialText = text to be completed.
	 *
	 * Return: a completed string, or %NULL if no completion exists.
	 *     This string is not owned by GIO, so remember to g_free() it
	 *     when finished.
	 */
	public string getCompletionSuffix(string initialText)
	{
		return Str.toString(g_filename_completer_get_completion_suffix(gFilenameCompleter, Str.toStringz(initialText)));
	}

	/**
	 * Gets an array of completion strings for a given initial text.
	 *
	 * Params:
	 *     initialText = text to be completed.
	 *
	 * Return: array of strings with possible completions for @initial_text.
	 *     This array must be freed by g_strfreev() when finished.
	 */
	public string[] getCompletions(string initialText)
	{
		return Str.toStringArray(g_filename_completer_get_completions(gFilenameCompleter, Str.toStringz(initialText)));
	}

	/**
	 * If @dirs_only is %TRUE, @completer will only
	 * complete directory names, and not file names.
	 *
	 * Params:
	 *     dirsOnly = a #gboolean.
	 */
	public void setDirsOnly(bool dirsOnly)
	{
		g_filename_completer_set_dirs_only(gFilenameCompleter, dirsOnly);
	}

	int[string] connectedSignals;

	void delegate(FilenameCompleter)[] onGotCompletionDataListeners;
	/**
	 * Emitted when the file name completion information comes available.
	 */
	void addOnGotCompletionData(void delegate(FilenameCompleter) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "got-completion-data" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"got-completion-data",
				cast(GCallback)&callBackGotCompletionData,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["got-completion-data"] = 1;
		}
		onGotCompletionDataListeners ~= dlg;
	}
	extern(C) static void callBackGotCompletionData(GFilenameCompleter* filenamecompleterStruct, FilenameCompleter _filenamecompleter)
	{
		foreach ( void delegate(FilenameCompleter) dlg; _filenamecompleter.onGotCompletionDataListeners )
		{
			dlg(_filenamecompleter);
		}
	}
}
