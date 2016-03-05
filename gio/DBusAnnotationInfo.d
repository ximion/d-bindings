/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gio.DBusAnnotationInfo;

private import gi.gio;
public  import gi.giotypes;
private import glib.Str;
private import gobject.ObjectG;


/**
 * Information about an annotation.
 *
 * Since: 2.26
 */
public class DBusAnnotationInfo
{
	/** the main GObject struct */
	protected GDBusAnnotationInfo* gDBusAnnotationInfo;

	/** Get the main GObject struct */
	public GDBusAnnotationInfo* getDBusAnnotationInfoStruct()
	{
		return gDBusAnnotationInfo;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gDBusAnnotationInfo;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDBusAnnotationInfo* gDBusAnnotationInfo)
	{
		this.gDBusAnnotationInfo = gDBusAnnotationInfo;
	}

	/**
	 * Looks up the value of an annotation.
	 *
	 * The cost of this function is O(n) in number of annotations.
	 *
	 * Params:
	 *     annotations = A %NULL-terminated array of annotations or %NULL.
	 *     name = The name of the annotation to look up.
	 *
	 * Return: The value or %NULL if not found. Do not free, it is owned by @annotations.
	 *
	 * Since: 2.26
	 */
	public static string lookup(DBusAnnotationInfo[] annotations, string name)
	{
		GDBusAnnotationInfo*[] annotationsArray = new GDBusAnnotationInfo*[annotations.length+1];
		for ( int i = 0; i < annotations.length ; i++ )
		{
			annotationsArray[i] = annotations[i].getDBusAnnotationInfoStruct();
		}
		annotationsArray[$-1] = null;
		
		return Str.toString(g_dbus_annotation_info_lookup(annotationsArray.ptr, Str.toStringz(name)));
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return g_dbus_annotation_info_get_type();
	}

	/**
	 * If @info is statically allocated does nothing. Otherwise increases
	 * the reference count.
	 *
	 * Return: The same @info.
	 *
	 * Since: 2.26
	 */
	public DBusAnnotationInfo doref()
	{
		auto p = g_dbus_annotation_info_ref(gDBusAnnotationInfo);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusAnnotationInfo)(cast(GDBusAnnotationInfo*) p);
	}

	/**
	 * If @info is statically allocated, does nothing. Otherwise decreases
	 * the reference count of @info. When its reference count drops to 0,
	 * the memory used is freed.
	 *
	 * Since: 2.26
	 */
	public void unref()
	{
		g_dbus_annotation_info_unref(gDBusAnnotationInfo);
	}
}
