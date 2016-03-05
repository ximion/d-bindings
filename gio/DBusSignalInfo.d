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


module gio.DBusSignalInfo;

private import gi.gio;
public  import gi.giotypes;
private import gobject.ObjectG;


/**
 * Information about a signal on a D-Bus interface.
 *
 * Since: 2.26
 */
public class DBusSignalInfo
{
	/** the main GObject struct */
	protected GDBusSignalInfo* gDBusSignalInfo;

	/** Get the main GObject struct */
	public GDBusSignalInfo* getDBusSignalInfoStruct()
	{
		return gDBusSignalInfo;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gDBusSignalInfo;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDBusSignalInfo* gDBusSignalInfo)
	{
		this.gDBusSignalInfo = gDBusSignalInfo;
	}


	/** */
	public static GType getType()
	{
		return g_dbus_signal_info_get_type();
	}

	/**
	 * If @info is statically allocated does nothing. Otherwise increases
	 * the reference count.
	 *
	 * Return: The same @info.
	 *
	 * Since: 2.26
	 */
	public DBusSignalInfo doref()
	{
		auto p = g_dbus_signal_info_ref(gDBusSignalInfo);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusSignalInfo)(cast(GDBusSignalInfo*) p);
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
		g_dbus_signal_info_unref(gDBusSignalInfo);
	}
}
