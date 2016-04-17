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


module gio.DBusObjectProxy;

private import gi.gio;
public  import gi.giotypes;
private import gio.DBusConnection;
private import gio.DBusObjectIF;
private import gio.DBusObjectT;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * A #GDBusObjectProxy is an object used to represent a remote object
 * with one or more D-Bus interfaces. Normally, you don't instantiate
 * a #GDBusObjectProxy yourself - typically #GDBusObjectManagerClient
 * is used to obtain it.
 *
 * Since: 2.30
 */
public class DBusObjectProxy : ObjectG, DBusObjectIF
{
	/** the main GObject struct */
	protected GDBusObjectProxy* gDBusObjectProxy;

	/** Get the main GObject struct */
	public GDBusObjectProxy* getDBusObjectProxyStruct()
	{
		return gDBusObjectProxy;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gDBusObjectProxy;
	}

	protected override void setStruct(GObject* obj)
	{
		gDBusObjectProxy = cast(GDBusObjectProxy*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDBusObjectProxy* gDBusObjectProxy, bool ownedRef = false)
	{
		this.gDBusObjectProxy = gDBusObjectProxy;
		super(cast(GObject*)gDBusObjectProxy, ownedRef);
	}

	// add the DBusObject capabilities
	mixin DBusObjectT!(GDBusObjectProxy);


	/** */
	public static GType getType()
	{
		return g_dbus_object_proxy_get_type();
	}

	/**
	 * Creates a new #GDBusObjectProxy for the given connection and
	 * object path.
	 *
	 * Params:
	 *     connection = a #GDBusConnection
	 *     objectPath = the object path
	 *
	 * Return: a new #GDBusObjectProxy
	 *
	 * Since: 2.30
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(DBusConnection connection, string objectPath)
	{
		auto p = g_dbus_object_proxy_new((connection is null) ? null : connection.getDBusConnectionStruct(), Str.toStringz(objectPath));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GDBusObjectProxy*) p, true);
	}

	/**
	 * Gets the connection that @proxy is for.
	 *
	 * Return: A #GDBusConnection. Do not free, the
	 *     object is owned by @proxy.
	 *
	 * Since: 2.30
	 */
	public DBusConnection getConnection()
	{
		auto p = g_dbus_object_proxy_get_connection(gDBusObjectProxy);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusConnection)(cast(GDBusConnection*) p);
	}
}
