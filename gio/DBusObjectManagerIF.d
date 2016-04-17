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


module gio.DBusObjectManagerIF;

private import gi.gio;
public  import gi.giotypes;
private import gio.DBusInterface;
private import gio.DBusInterfaceIF;
private import gio.DBusObject;
private import gio.DBusObjectIF;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;


/**
 * The #GDBusObjectManager type is the base type for service- and
 * client-side implementations of the standardized
 * [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
 * interface.
 * 
 * See #GDBusObjectManagerClient for the client-side implementation
 * and #GDBusObjectManagerServer for the service-side implementation.
 */
public interface DBusObjectManagerIF{
	/** Get the main GObject struct */
	public GDBusObjectManager* getDBusObjectManagerStruct();

	/** the main GObject struct as a void* */
	protected void* getStruct();


	/**
	 * Gets the interface proxy for @interface_name at @object_path, if
	 * any.
	 *
	 * Params:
	 *     objectPath = Object path to lookup.
	 *     interfaceName = D-Bus interface name to lookup.
	 *
	 * Return: A #GDBusInterface instance or %NULL. Free
	 *     with g_object_unref().
	 *
	 * Since: 2.30
	 */
	public DBusInterfaceIF getInterface(string objectPath, string interfaceName);

	/**
	 * Gets the #GDBusObjectProxy at @object_path, if any.
	 *
	 * Params:
	 *     objectPath = Object path to lookup.
	 *
	 * Return: A #GDBusObject or %NULL. Free with
	 *     g_object_unref().
	 *
	 * Since: 2.30
	 */
	public DBusObjectIF getObject(string objectPath);

	/**
	 * Gets the object path that @manager is for.
	 *
	 * Return: A string owned by @manager. Do not free.
	 *
	 * Since: 2.30
	 */
	public string getObjectPath();

	/**
	 * Gets all #GDBusObject objects known to @manager.
	 *
	 * Return: A list of
	 *     #GDBusObject objects. The returned list should be freed with
	 *     g_list_free() after each element has been freed with
	 *     g_object_unref().
	 *
	 * Since: 2.30
	 */
	public ListG getObjects();
	@property void delegate(DBusObjectIF, DBusInterfaceIF, DBusObjectManagerIF)[] onInterfaceAddedListeners();
	/**
	 * Emitted when @interface is added to @object.
	 *
	 * This signal exists purely as a convenience to avoid having to
	 * connect signals to all objects managed by @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject on which an interface was added.
	 *     iface = The #GDBusInterface that was added.
	 *
	 * Since: 2.30
	 */
	void addOnInterfaceAdded(void delegate(DBusObjectIF, DBusInterfaceIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	@property void delegate(DBusObjectIF, DBusInterfaceIF, DBusObjectManagerIF)[] onInterfaceRemovedListeners();
	/**
	 * Emitted when @interface has been removed from @object.
	 *
	 * This signal exists purely as a convenience to avoid having to
	 * connect signals to all objects managed by @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject on which an interface was removed.
	 *     iface = The #GDBusInterface that was removed.
	 *
	 * Since: 2.30
	 */
	void addOnInterfaceRemoved(void delegate(DBusObjectIF, DBusInterfaceIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	@property void delegate(DBusObjectIF, DBusObjectManagerIF)[] onObjectAddedListeners();
	/**
	 * Emitted when @object is added to @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject that was added.
	 *
	 * Since: 2.30
	 */
	void addOnObjectAdded(void delegate(DBusObjectIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	@property void delegate(DBusObjectIF, DBusObjectManagerIF)[] onObjectRemovedListeners();
	/**
	 * Emitted when @object is removed from @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject that was removed.
	 *
	 * Since: 2.30
	 */
	void addOnObjectRemoved(void delegate(DBusObjectIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

}
