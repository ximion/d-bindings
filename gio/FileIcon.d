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


module gio.FileIcon;

private import gi.gio;
public  import gi.giotypes;
private import gio.File;
private import gio.FileIF;
private import gio.IconIF;
private import gio.IconT;
private import gio.LoadableIconIF;
private import gio.LoadableIconT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GFileIcon specifies an icon by pointing to an image file
 * to be used as icon.
 */
public class FileIcon : ObjectG, IconIF, LoadableIconIF
{
	/** the main GObject struct */
	protected GFileIcon* gFileIcon;

	/** Get the main GObject struct */
	public GFileIcon* getFileIconStruct()
	{
		return gFileIcon;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFileIcon;
	}

	protected override void setStruct(GObject* obj)
	{
		gFileIcon = cast(GFileIcon*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFileIcon* gFileIcon, bool ownedRef = false)
	{
		this.gFileIcon = gFileIcon;
		super(cast(GObject*)gFileIcon, ownedRef);
	}

	// add the Icon capabilities
	mixin IconT!(GFileIcon);

	// add the LoadableIcon capabilities
	mixin LoadableIconT!(GFileIcon);


	/** */
	public static GType getType()
	{
		return g_file_icon_get_type();
	}

	/**
	 * Creates a new icon for a file.
	 *
	 * Params:
	 *     file = a #GFile.
	 *
	 * Return: a #GIcon for the given
	 *     @file, or %NULL on error.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(FileIF file)
	{
		auto p = g_file_icon_new((file is null) ? null : file.getFileStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GFileIcon*) p, true);
	}

	/**
	 * Gets the #GFile associated with the given @icon.
	 *
	 * Return: a #GFile, or %NULL.
	 */
	public FileIF getFile()
	{
		auto p = g_file_icon_get_file(gFileIcon);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(File, FileIF)(cast(GFile*) p);
	}
}
