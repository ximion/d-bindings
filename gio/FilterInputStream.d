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


module gio.FilterInputStream;

private import gi.gio;
public  import gi.giotypes;
private import gio.InputStream;
private import gobject.ObjectG;


/**
 * Base class for input stream implementations that perform some
 * kind of filtering operation on a base stream. Typical examples
 * of filtering operations are character set conversion, compression
 * and byte order flipping.
 */
public class FilterInputStream : InputStream
{
	/** the main GObject struct */
	protected GFilterInputStream* gFilterInputStream;

	/** Get the main GObject struct */
	public GFilterInputStream* getFilterInputStreamStruct()
	{
		return gFilterInputStream;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFilterInputStream;
	}

	protected override void setStruct(GObject* obj)
	{
		gFilterInputStream = cast(GFilterInputStream*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFilterInputStream* gFilterInputStream, bool ownedRef = false)
	{
		this.gFilterInputStream = gFilterInputStream;
		super(cast(GInputStream*)gFilterInputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_filter_input_stream_get_type();
	}

	/**
	 * Gets the base stream for the filter stream.
	 *
	 * Return: a #GInputStream.
	 */
	public InputStream getBaseStream()
	{
		auto p = g_filter_input_stream_get_base_stream(gFilterInputStream);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) p);
	}

	/**
	 * Returns whether the base stream will be closed when @stream is
	 * closed.
	 *
	 * Return: %TRUE if the base stream will be closed.
	 */
	public bool getCloseBaseStream()
	{
		return g_filter_input_stream_get_close_base_stream(gFilterInputStream) != 0;
	}

	/**
	 * Sets whether the base stream will be closed when @stream is closed.
	 *
	 * Params:
	 *     closeBase = %TRUE to close the base stream.
	 */
	public void setCloseBaseStream(bool closeBase)
	{
		g_filter_input_stream_set_close_base_stream(gFilterInputStream, closeBase);
	}
}
