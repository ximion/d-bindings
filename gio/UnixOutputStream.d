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


module gio.UnixOutputStream;

private import gi.gio;
public  import gi.giotypes;
private import gio.FileDescriptorBasedIF;
private import gio.FileDescriptorBasedT;
private import gio.OutputStream;
private import gio.PollableOutputStreamIF;
private import gio.PollableOutputStreamT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GUnixOutputStream implements #GOutputStream for writing to a UNIX
 * file descriptor, including asynchronous operations. (If the file
 * descriptor refers to a socket or pipe, this will use poll() to do
 * asynchronous I/O. If it refers to a regular file, it will fall back
 * to doing asynchronous I/O in another thread.)
 * 
 * Note that `<gio/gunixoutputstream.h>` belongs to the UNIX-specific GIO
 * interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config file
 * when using it.
 */
public class UnixOutputStream : OutputStream, FileDescriptorBasedIF, PollableOutputStreamIF
{
	/** the main GObject struct */
	protected GUnixOutputStream* gUnixOutputStream;

	/** Get the main GObject struct */
	public GUnixOutputStream* getUnixOutputStreamStruct()
	{
		return gUnixOutputStream;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gUnixOutputStream;
	}

	protected override void setStruct(GObject* obj)
	{
		gUnixOutputStream = cast(GUnixOutputStream*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GUnixOutputStream* gUnixOutputStream, bool ownedRef = false)
	{
		this.gUnixOutputStream = gUnixOutputStream;
		super(cast(GOutputStream*)gUnixOutputStream, ownedRef);
	}

	// add the FileDescriptorBased capabilities
	mixin FileDescriptorBasedT!(GUnixOutputStream);

	// add the PollableOutputStream capabilities
	mixin PollableOutputStreamT!(GUnixOutputStream);


	/** */
	public static GType getType()
	{
		return g_unix_output_stream_get_type();
	}

	/**
	 * Creates a new #GUnixOutputStream for the given @fd.
	 *
	 * If @close_fd, is %TRUE, the file descriptor will be closed when
	 * the output stream is destroyed.
	 *
	 * Params:
	 *     fd = a UNIX file descriptor
	 *     closeFd = %TRUE to close the file descriptor when done
	 *
	 * Return: a new #GOutputStream
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(int fd, bool closeFd)
	{
		auto p = g_unix_output_stream_new(fd, closeFd);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GUnixOutputStream*) p, true);
	}

	/**
	 * Returns whether the file descriptor of @stream will be
	 * closed when the stream is closed.
	 *
	 * Return: %TRUE if the file descriptor is closed when done
	 *
	 * Since: 2.20
	 */
	public bool getCloseFd()
	{
		return g_unix_output_stream_get_close_fd(gUnixOutputStream) != 0;
	}

	/**
	 * Return the UNIX file descriptor that the stream writes to.
	 *
	 * Return: The file descriptor of @stream
	 *
	 * Since: 2.20
	 */
	public int getFd()
	{
		return g_unix_output_stream_get_fd(gUnixOutputStream);
	}

	/**
	 * Sets whether the file descriptor of @stream shall be closed
	 * when the stream is closed.
	 *
	 * Params:
	 *     closeFd = %TRUE to close the file descriptor when done
	 *
	 * Since: 2.20
	 */
	public void setCloseFd(bool closeFd)
	{
		g_unix_output_stream_set_close_fd(gUnixOutputStream, closeFd);
	}
}
