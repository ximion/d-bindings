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


module gio.BufferedOutputStream;

private import gi.gio;
public  import gi.giotypes;
private import gio.FilterOutputStream;
private import gio.OutputStream;
private import gio.SeekableIF;
private import gio.SeekableT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * Buffered output stream implements #GFilterOutputStream and provides
 * for buffered writes.
 * 
 * By default, #GBufferedOutputStream's buffer size is set at 4 kilobytes.
 * 
 * To create a buffered output stream, use g_buffered_output_stream_new(),
 * or g_buffered_output_stream_new_sized() to specify the buffer's size
 * at construction.
 * 
 * To get the size of a buffer within a buffered input stream, use
 * g_buffered_output_stream_get_buffer_size(). To change the size of a
 * buffered output stream's buffer, use
 * g_buffered_output_stream_set_buffer_size(). Note that the buffer's
 * size cannot be reduced below the size of the data within the buffer.
 */
public class BufferedOutputStream : FilterOutputStream, SeekableIF
{
	/** the main GObject struct */
	protected GBufferedOutputStream* gBufferedOutputStream;

	/** Get the main GObject struct */
	public GBufferedOutputStream* getBufferedOutputStreamStruct()
	{
		return gBufferedOutputStream;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gBufferedOutputStream;
	}

	protected override void setStruct(GObject* obj)
	{
		gBufferedOutputStream = cast(GBufferedOutputStream*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GBufferedOutputStream* gBufferedOutputStream, bool ownedRef = false)
	{
		this.gBufferedOutputStream = gBufferedOutputStream;
		super(cast(GFilterOutputStream*)gBufferedOutputStream, ownedRef);
	}

	// add the Seekable capabilities
	mixin SeekableT!(GBufferedOutputStream);


	/** */
	public static GType getType()
	{
		return g_buffered_output_stream_get_type();
	}

	/**
	 * Creates a new buffered output stream for a base stream.
	 *
	 * Params:
	 *     baseStream = a #GOutputStream.
	 *
	 * Return: a #GOutputStream for the given @base_stream.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(OutputStream baseStream)
	{
		auto p = g_buffered_output_stream_new((baseStream is null) ? null : baseStream.getOutputStreamStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GBufferedOutputStream*) p, true);
	}

	/**
	 * Creates a new buffered output stream with a given buffer size.
	 *
	 * Params:
	 *     baseStream = a #GOutputStream.
	 *     size = a #gsize.
	 *
	 * Return: a #GOutputStream with an internal buffer set to @size.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(OutputStream baseStream, size_t size)
	{
		auto p = g_buffered_output_stream_new_sized((baseStream is null) ? null : baseStream.getOutputStreamStruct(), size);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_sized");
		}
		
		this(cast(GBufferedOutputStream*) p, true);
	}

	/**
	 * Checks if the buffer automatically grows as data is added.
	 *
	 * Return: %TRUE if the @stream's buffer automatically grows,
	 *     %FALSE otherwise.
	 */
	public bool getAutoGrow()
	{
		return g_buffered_output_stream_get_auto_grow(gBufferedOutputStream) != 0;
	}

	/**
	 * Gets the size of the buffer in the @stream.
	 *
	 * Return: the current size of the buffer.
	 */
	public size_t getBufferSize()
	{
		return g_buffered_output_stream_get_buffer_size(gBufferedOutputStream);
	}

	/**
	 * Sets whether or not the @stream's buffer should automatically grow.
	 * If @auto_grow is true, then each write will just make the buffer
	 * larger, and you must manually flush the buffer to actually write out
	 * the data to the underlying stream.
	 *
	 * Params:
	 *     autoGrow = a #gboolean.
	 */
	public void setAutoGrow(bool autoGrow)
	{
		g_buffered_output_stream_set_auto_grow(gBufferedOutputStream, autoGrow);
	}

	/**
	 * Sets the size of the internal buffer to @size.
	 *
	 * Params:
	 *     size = a #gsize.
	 */
	public void setBufferSize(size_t size)
	{
		g_buffered_output_stream_set_buffer_size(gBufferedOutputStream, size);
	}
}
