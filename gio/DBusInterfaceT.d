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


module gio.DBusInterfaceT;

public  import gi.gio;
public  import gi.giotypes;
public  import gio.DBusInterfaceInfo;
public  import gio.DBusObject;
public  import gio.DBusObjectIF;
public  import gobject.ObjectG;


/**
 * The #GDBusInterface type is the base type for D-Bus interfaces both
 * on the service side (see #GDBusInterfaceSkeleton) and client side
 * (see #GDBusProxy).
 *
 * Since: 2.30
 */
public template DBusInterfaceT(TStruct)
{
	/** Get the main GObject struct */
	public GDBusInterface* getDBusInterfaceStruct()
	{
		return cast(GDBusInterface*)getStruct();
	}


	/**
	 * Gets the #GDBusObject that @interface_ belongs to, if any.
	 *
	 * Return: A #GDBusObject or %NULL. The returned
	 *     reference should be freed with g_object_unref().
	 *
	 * Since: 2.32
	 */
	public DBusObjectIF dupObject()
	{
		auto p = g_dbus_interface_dup_object(getDBusInterfaceStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusObject, DBusObjectIF)(cast(GDBusObject*) p);
	}

	/**
	 * Gets D-Bus introspection information for the D-Bus interface
	 * implemented by @interface_.
	 *
	 * Return: A #GDBusInterfaceInfo. Do not free.
	 *
	 * Since: 2.30
	 */
	public DBusInterfaceInfo getInfo()
	{
		auto p = g_dbus_interface_get_info(getDBusInterfaceStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusInterfaceInfo)(cast(GDBusInterfaceInfo*) p);
	}

	/**
	 * Gets the #GDBusObject that @interface_ belongs to, if any.
	 *
	 * It is not safe to use the returned object if @interface_ or
	 * the returned object is being used from other threads. See
	 * g_dbus_interface_dup_object() for a thread-safe alternative.
	 *
	 * Return: A #GDBusObject or %NULL. The returned
	 *     reference belongs to @interface_ and should not be freed.
	 *
	 * Since: 2.30
	 */
	public DBusObjectIF getObject()
	{
		auto p = g_dbus_interface_get_object(getDBusInterfaceStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusObject, DBusObjectIF)(cast(GDBusObject*) p);
	}

	/**
	 * Sets the #GDBusObject for @interface_ to @object.
	 *
	 * Note that @interface_ will hold a weak reference to @object.
	 *
	 * Params:
	 *     object = A #GDBusObject or %NULL.
	 *
	 * Since: 2.30
	 */
	public void setObject(DBusObjectIF object)
	{
		g_dbus_interface_set_object(getDBusInterfaceStruct(), (object is null) ? null : object.getDBusObjectStruct());
	}
}
