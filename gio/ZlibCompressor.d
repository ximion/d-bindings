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


module gio.ZlibCompressor;

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
public class ZlibCompressor : ObjectG, ConverterIF
{
	/** the main GObject struct */
	protected GZlibCompressor* gZlibCompressor;

	/** Get the main GObject struct */
	public GZlibCompressor* getZlibCompressorStruct()
	{
		return gZlibCompressor;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gZlibCompressor;
	}

	protected override void setStruct(GObject* obj)
	{
		gZlibCompressor = cast(GZlibCompressor*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GZlibCompressor* gZlibCompressor, bool ownedRef = false)
	{
		this.gZlibCompressor = gZlibCompressor;
		super(cast(GObject*)gZlibCompressor, ownedRef);
	}

	// add the Converter capabilities
	mixin ConverterT!(GZlibCompressor);


	/** */
	public static GType getType()
	{
		return g_zlib_compressor_get_type();
	}

	/**
	 * Creates a new #GZlibCompressor.
	 *
	 * Params:
	 *     format = The format to use for the compressed data
	 *     level = compression level (0-9), -1 for default
	 *
	 * Return: a new #GZlibCompressor
	 *
	 * Since: 2.24
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(GZlibCompressorFormat format, int level)
	{
		auto p = g_zlib_compressor_new(format, level);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GZlibCompressor*) p, true);
	}

	/**
	 * Returns the #GZlibCompressor:file-info property.
	 *
	 * Return: a #GFileInfo, or %NULL
	 *
	 * Since: 2.26
	 */
	public FileInfo getFileInfo()
	{
		auto p = g_zlib_compressor_get_file_info(gZlibCompressor);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(FileInfo)(cast(GFileInfo*) p);
	}

	/**
	 * Sets @file_info in @compressor. If non-%NULL, and @compressor's
	 * #GZlibCompressor:format property is %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
	 * it will be used to set the file name and modification time in
	 * the GZIP header of the compressed data.
	 *
	 * Note: it is an error to call this function while a compression is in
	 * progress; it may only be called immediately after creation of @compressor,
	 * or after resetting it with g_converter_reset().
	 *
	 * Params:
	 *     fileInfo = a #GFileInfo
	 *
	 * Since: 2.26
	 */
	public void setFileInfo(FileInfo fileInfo)
	{
		g_zlib_compressor_set_file_info(gZlibCompressor, (fileInfo is null) ? null : fileInfo.getFileInfoStruct());
	}
}
