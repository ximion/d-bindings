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


module gio.ZlibDecompressor;

private import gi.gio;
public  import gi.giotypes;
private import gio.ConverterIF;
private import gio.ConverterT;
private import gio.FileInfo;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * Zlib decompression
 */
public class ZlibDecompressor : ObjectG, ConverterIF
{
	/** the main GObject struct */
	protected GZlibDecompressor* gZlibDecompressor;

	/** Get the main GObject struct */
	public GZlibDecompressor* getZlibDecompressorStruct()
	{
		return gZlibDecompressor;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gZlibDecompressor;
	}

	protected override void setStruct(GObject* obj)
	{
		gZlibDecompressor = cast(GZlibDecompressor*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GZlibDecompressor* gZlibDecompressor, bool ownedRef = false)
	{
		this.gZlibDecompressor = gZlibDecompressor;
		super(cast(GObject*)gZlibDecompressor, ownedRef);
	}

	// add the Converter capabilities
	mixin ConverterT!(GZlibDecompressor);


	/** */
	public static GType getType()
	{
		return g_zlib_decompressor_get_type();
	}

	/**
	 * Creates a new #GZlibDecompressor.
	 *
	 * Params:
	 *     format = The format to use for the compressed data
	 *
	 * Return: a new #GZlibDecompressor
	 *
	 * Since: 2.24
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(GZlibCompressorFormat format)
	{
		auto p = g_zlib_decompressor_new(format);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GZlibDecompressor*) p, true);
	}

	/**
	 * Retrieves the #GFileInfo constructed from the GZIP header data
	 * of compressed data processed by @compressor, or %NULL if @decompressor's
	 * #GZlibDecompressor:format property is not %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
	 * or the header data was not fully processed yet, or it not present in the
	 * data stream at all.
	 *
	 * Return: a #GFileInfo, or %NULL
	 *
	 * Since: 2.26
	 */
	public FileInfo getFileInfo()
	{
		auto p = g_zlib_decompressor_get_file_info(gZlibDecompressor);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(FileInfo)(cast(GFileInfo*) p);
	}
}
