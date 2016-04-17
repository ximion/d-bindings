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


module gio.Vfs;

private import gi.gio;
public  import gi.giotypes;
private import gio.File;
private import gio.FileIF;
private import glib.Str;
private import gobject.ObjectG;


/**
 * Entry point for using GIO functionality.
 */
public class Vfs : ObjectG
{
	/** the main GObject struct */
	protected GVfs* gVfs;

	/** Get the main GObject struct */
	public GVfs* getVfsStruct()
	{
		return gVfs;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gVfs;
	}

	protected override void setStruct(GObject* obj)
	{
		gVfs = cast(GVfs*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GVfs* gVfs, bool ownedRef = false)
	{
		this.gVfs = gVfs;
		super(cast(GObject*)gVfs, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_vfs_get_type();
	}

	/**
	 * Gets the default #GVfs for the system.
	 *
	 * Return: a #GVfs.
	 */
	public static Vfs getDefault()
	{
		auto p = g_vfs_get_default();
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Vfs)(cast(GVfs*) p);
	}

	/**
	 * Gets the local #GVfs for the system.
	 *
	 * Return: a #GVfs.
	 */
	public static Vfs getLocal()
	{
		auto p = g_vfs_get_local();
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Vfs)(cast(GVfs*) p);
	}

	/**
	 * Gets a #GFile for @path.
	 *
	 * Params:
	 *     path = a string containing a VFS path.
	 *
	 * Return: a #GFile.
	 *     Free the returned object with g_object_unref().
	 */
	public FileIF getFileForPath(string path)
	{
		auto p = g_vfs_get_file_for_path(gVfs, Str.toStringz(path));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(File, FileIF)(cast(GFile*) p);
	}

	/**
	 * Gets a #GFile for @uri.
	 *
	 * This operation never fails, but the returned object
	 * might not support any I/O operation if the URI
	 * is malformed or if the URI scheme is not supported.
	 *
	 * Params:
	 *     uri = a string containing a URI
	 *
	 * Return: a #GFile.
	 *     Free the returned object with g_object_unref().
	 */
	public FileIF getFileForUri(string uri)
	{
		auto p = g_vfs_get_file_for_uri(gVfs, Str.toStringz(uri));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(File, FileIF)(cast(GFile*) p);
	}

	/**
	 * Gets a list of URI schemes supported by @vfs.
	 *
	 * Return: a %NULL-terminated array of strings.
	 *     The returned array belongs to GIO and must
	 *     not be freed or modified.
	 */
	public string[] getSupportedUriSchemes()
	{
		return Str.toStringArray(g_vfs_get_supported_uri_schemes(gVfs));
	}

	/**
	 * Checks if the VFS is active.
	 *
	 * Return: %TRUE if construction of the @vfs was successful
	 *     and it is now active.
	 */
	public bool isActive()
	{
		return g_vfs_is_active(gVfs) != 0;
	}

	/**
	 * This operation never fails, but the returned object might
	 * not support any I/O operations if the @parse_name cannot
	 * be parsed by the #GVfs module.
	 *
	 * Params:
	 *     parseName = a string to be parsed by the VFS module.
	 *
	 * Return: a #GFile for the given @parse_name.
	 *     Free the returned object with g_object_unref().
	 */
	public FileIF parseName(string parseName)
	{
		auto p = g_vfs_parse_name(gVfs, Str.toStringz(parseName));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(File, FileIF)(cast(GFile*) p);
	}
}
