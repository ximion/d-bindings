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


module gio.ConverterOutputStream;

private import gi.gio;
public  import gi.giotypes;
private import gio.Converter;
private import gio.ConverterIF;
private import gio.FilterOutputStream;
private import gio.OutputStream;
private import gio.PollableOutputStreamIF;
private import gio.PollableOutputStreamT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * Converter output stream implements #GOutputStream and allows
 * conversion of data of various types during reading.
 * 
 * As of GLib 2.34, #GConverterOutputStream implements
 * #GPollableOutputStream.
 */
public class ConverterOutputStream : FilterOutputStream, PollableOutputStreamIF
{
	/** the main GObject struct */
	protected GConverterOutputStream* gConverterOutputStream;

	/** Get the main GObject struct */
	public GConverterOutputStream* getConverterOutputStreamStruct()
	{
		return gConverterOutputStream;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gConverterOutputStream;
	}

	protected override void setStruct(GObject* obj)
	{
		gConverterOutputStream = cast(GConverterOutputStream*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GConverterOutputStream* gConverterOutputStream, bool ownedRef = false)
	{
		this.gConverterOutputStream = gConverterOutputStream;
		super(cast(GFilterOutputStream*)gConverterOutputStream, ownedRef);
	}

	// add the PollableOutputStream capabilities
	mixin PollableOutputStreamT!(GConverterOutputStream);


	/** */
	public static GType getType()
	{
		return g_converter_output_stream_get_type();
	}

	/**
	 * Creates a new converter output stream for the @base_stream.
	 *
	 * Params:
	 *     baseStream = a #GOutputStream
	 *     converter = a #GConverter
	 *
	 * Return: a new #GOutputStream.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(OutputStream baseStream, ConverterIF converter)
	{
		auto p = g_converter_output_stream_new((baseStream is null) ? null : baseStream.getOutputStreamStruct(), (converter is null) ? null : converter.getConverterStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GConverterOutputStream*) p, true);
	}

	/**
	 * Gets the #GConverter that is used by @converter_stream.
	 *
	 * Return: the converter of the converter output stream
	 *
	 * Since: 2.24
	 */
	public ConverterIF getConverter()
	{
		auto p = g_converter_output_stream_get_converter(gConverterOutputStream);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Converter, ConverterIF)(cast(GConverter*) p);
	}
}
