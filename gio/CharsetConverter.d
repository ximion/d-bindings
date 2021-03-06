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


module gio.CharsetConverter;

private import gi.gio;
public  import gi.giotypes;
private import gio.ConverterIF;
private import gio.ConverterT;
private import gio.InitableIF;
private import gio.InitableT;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * #GCharsetConverter is an implementation of #GConverter based on
 * GIConv.
 */
public class CharsetConverter : ObjectG, ConverterIF, InitableIF
{
	/** the main GObject struct */
	protected GCharsetConverter* gCharsetConverter;

	/** Get the main GObject struct */
	public GCharsetConverter* getCharsetConverterStruct()
	{
		return gCharsetConverter;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gCharsetConverter;
	}

	protected override void setStruct(GObject* obj)
	{
		gCharsetConverter = cast(GCharsetConverter*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GCharsetConverter* gCharsetConverter, bool ownedRef = false)
	{
		this.gCharsetConverter = gCharsetConverter;
		super(cast(GObject*)gCharsetConverter, ownedRef);
	}

	// add the Converter capabilities
	mixin ConverterT!(GCharsetConverter);

	// add the Initable capabilities
	mixin InitableT!(GCharsetConverter);


	/** */
	public static GType getType()
	{
		return g_charset_converter_get_type();
	}

	/**
	 * Creates a new #GCharsetConverter.
	 *
	 * Params:
	 *     toCharset = destination charset
	 *     fromCharset = source charset
	 *
	 * Return: a new #GCharsetConverter or %NULL on error.
	 *
	 * Since: 2.24
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string toCharset, string fromCharset)
	{
		GError* err = null;
		
		auto p = g_charset_converter_new(Str.toStringz(toCharset), Str.toStringz(fromCharset), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GCharsetConverter*) p, true);
	}

	/**
	 * Gets the number of fallbacks that @converter has applied so far.
	 *
	 * Return: the number of fallbacks that @converter has applied
	 *
	 * Since: 2.24
	 */
	public uint getNumFallbacks()
	{
		return g_charset_converter_get_num_fallbacks(gCharsetConverter);
	}

	/**
	 * Gets the #GCharsetConverter:use-fallback property.
	 *
	 * Return: %TRUE if fallbacks are used by @converter
	 *
	 * Since: 2.24
	 */
	public bool getUseFallback()
	{
		return g_charset_converter_get_use_fallback(gCharsetConverter) != 0;
	}

	/**
	 * Sets the #GCharsetConverter:use-fallback property.
	 *
	 * Params:
	 *     useFallback = %TRUE to use fallbacks
	 *
	 * Since: 2.24
	 */
	public void setUseFallback(bool useFallback)
	{
		g_charset_converter_set_use_fallback(gCharsetConverter, useFallback);
	}
}
