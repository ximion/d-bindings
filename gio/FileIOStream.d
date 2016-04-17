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


module gio.FileIOStream;

private import gi.gio;
public  import gi.giotypes;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileInfo;
private import gio.IOStream;
private import gio.SeekableIF;
private import gio.SeekableT;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * GFileIOStream provides io streams that both read and write to the same
 * file handle.
 * 
 * GFileIOStream implements #GSeekable, which allows the io
 * stream to jump to arbitrary positions in the file and to truncate
 * the file, provided the filesystem of the file supports these
 * operations.
 * 
 * To find the position of a file io stream, use
 * g_seekable_tell().
 * 
 * To find out if a file io stream supports seeking, use g_seekable_can_seek().
 * To position a file io stream, use g_seekable_seek().
 * To find out if a file io stream supports truncating, use
 * g_seekable_can_truncate(). To truncate a file io
 * stream, use g_seekable_truncate().
 * 
 * The default implementation of all the #GFileIOStream operations
 * and the implementation of #GSeekable just call into the same operations
 * on the output stream.
 */
public class FileIOStream : IOStream, SeekableIF
{
	/** the main GObject struct */
	protected GFileIOStream* gFileIOStream;

	/** Get the main GObject struct */
	public GFileIOStream* getFileIOStreamStruct()
	{
		return gFileIOStream;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFileIOStream;
	}

	protected override void setStruct(GObject* obj)
	{
		gFileIOStream = cast(GFileIOStream*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFileIOStream* gFileIOStream, bool ownedRef = false)
	{
		this.gFileIOStream = gFileIOStream;
		super(cast(GIOStream*)gFileIOStream, ownedRef);
	}

	// add the Seekable capabilities
	mixin SeekableT!(GFileIOStream);


	/** */
	public static GType getType()
	{
		return g_file_io_stream_get_type();
	}

	/**
	 * Gets the entity tag for the file when it has been written.
	 * This must be called after the stream has been written
	 * and closed, as the etag can change while writing.
	 *
	 * Return: the entity tag for the stream.
	 *
	 * Since: 2.22
	 */
	public string getEtag()
	{
		return Str.toString(g_file_io_stream_get_etag(gFileIOStream));
	}

	/**
	 * Queries a file io stream for the given @attributes.
	 * This function blocks while querying the stream. For the asynchronous
	 * version of this function, see g_file_io_stream_query_info_async().
	 * While the stream is blocked, the stream will set the pending flag
	 * internally, and any other operations on the stream will fail with
	 * %G_IO_ERROR_PENDING.
	 *
	 * Can fail if the stream was already closed (with @error being set to
	 * %G_IO_ERROR_CLOSED), the stream has pending operations (with @error being
	 * set to %G_IO_ERROR_PENDING), or if querying info is not supported for
	 * the stream's interface (with @error being set to %G_IO_ERROR_NOT_SUPPORTED). I
	 * all cases of failure, %NULL will be returned.
	 *
	 * If @cancellable is not %NULL, then the operation can be cancelled by
	 * triggering the cancellable object from another thread. If the operation
	 * was cancelled, the error %G_IO_ERROR_CANCELLED will be set, and %NULL will
	 * be returned.
	 *
	 * Params:
	 *     attributes = a file attribute query string.
	 *     cancellable = optional #GCancellable object, %NULL to ignore.
	 *
	 * Return: a #GFileInfo for the @stream, or %NULL on error.
	 *
	 * Since: 2.22
	 *
	 * Throws: GException on failure.
	 */
	public FileInfo queryInfo(string attributes, Cancellable cancellable)
	{
		GError* err = null;
		
		auto p = g_file_io_stream_query_info(gFileIOStream, Str.toStringz(attributes), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(FileInfo)(cast(GFileInfo*) p, true);
	}

	/**
	 * Asynchronously queries the @stream for a #GFileInfo. When completed,
	 * @callback will be called with a #GAsyncResult which can be used to
	 * finish the operation with g_file_io_stream_query_info_finish().
	 *
	 * For the synchronous version of this function, see
	 * g_file_io_stream_query_info().
	 *
	 * Params:
	 *     attributes = a file attribute query string.
	 *     ioPriority = the [I/O priority][gio-GIOScheduler] of the request
	 *     cancellable = optional #GCancellable object, %NULL to ignore.
	 *     callback = callback to call when the request is satisfied
	 *     userData = the data to pass to callback function
	 *
	 * Since: 2.22
	 */
	public void queryInfoAsync(string attributes, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		g_file_io_stream_query_info_async(gFileIOStream, Str.toStringz(attributes), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finalizes the asynchronous query started
	 * by g_file_io_stream_query_info_async().
	 *
	 * Params:
	 *     result = a #GAsyncResult.
	 *
	 * Return: A #GFileInfo for the finished query.
	 *
	 * Since: 2.22
	 *
	 * Throws: GException on failure.
	 */
	public FileInfo queryInfoFinish(AsyncResultIF result)
	{
		GError* err = null;
		
		auto p = g_file_io_stream_query_info_finish(gFileIOStream, (result is null) ? null : result.getAsyncResultStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(FileInfo)(cast(GFileInfo*) p, true);
	}
}
