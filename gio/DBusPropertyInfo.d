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


module gio.DBusPropertyInfo;

private import gi.gio;
public  import gi.giotypes;
private import gobject.ObjectG;


/**
 * Information about a D-Bus property on a D-Bus interface.
 *
 * Since: 2.26
 */
public class DBusPropertyInfo
{
	/** the main GObject struct */
	protected GDBusPropertyInfo* gDBusPropertyInfo;

	/** Get the main GObject struct */
	public GDBusPropertyInfo* getDBusPropertyInfoStruct()
	{
		return gDBusPropertyInfo;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gDBusPropertyInfo;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDBusPropertyInfo* gDBusPropertyInfo)
	{
		this.gDBusPropertyInfo = gDBusPropertyInfo;
	}


	/** */
	public static GType getType()
	{
		return g_dbus_property_info_get_type();
	}

	/**
	 * If @info is statically allocated does nothing. Otherwise increases
	 * the reference count.
	 *
	 * Return: The same @info.
	 *
	 * Since: 2.26
	 */
	public DBusPropertyInfo doref()
	{
		auto p = g_dbus_property_info_ref(gDBusPropertyInfo);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusPropertyInfo)(cast(GDBusPropertyInfo*) p);
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
		g_dbus_property_info_unref(gDBusPropertyInfo);
	}
}
