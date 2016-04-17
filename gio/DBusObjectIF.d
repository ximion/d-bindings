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


module gio.DBusObjectIF;

private import gi.gio;
public  import gi.giotypes;
private import gio.DBusInterface;
private import gio.DBusInterfaceIF;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;


/**
 * The #GDBusObject type is the base type for D-Bus objects on both
 * the service side (see #GDBusObjectSkeleton) and the client side
 * (see #GDBusObjectProxy). It is essentially just a container of
 * interfaces.
 */
public interface DBusObjectIF{
	/** Get the main GObject struct */
	public GDBusObject* getDBusObjectStruct();

	/** the main GObject struct as a void* */
	protected void* getStruct();


	/**
	 * Gets the D-Bus interface with name @interface_name associated with
	 * @object, if any.
	 *
	 * Params:
	 *     interfaceName = A D-Bus interface name.
	 *
	 * Return: %NULL if not found, otherwise a
	 *     #GDBusInterface that must be freed with g_object_unref().
	 *
	 * Since: 2.30
	 */
	public DBusInterfaceIF getInterface(string interfaceName);

	/**
	 * Gets the D-Bus interfaces associated with @object.
	 *
	 * Return: A list of #GDBusInterface instances.
	 *     The returned list must be freed by g_list_free() after each element has been freed
	 *     with g_object_unref().
	 *
	 * Since: 2.30
	 */
	public ListG getInterfaces();

	/**
	 * Gets the object path for @object.
	 *
	 * Return: A string owned by @object. Do not free.
	 *
	 * Since: 2.30
	 */
	public string getObjectPath();
	@property void delegate(DBusInterfaceIF, DBusObjectIF)[] onInterfaceAddedListeners();
	/**
	 * Emitted when @interface is added to @object.
	 *
	 * Params:
	 *     iface = The #GDBusInterface that was added.
	 *
	 * Since: 2.30
	 */
	void addOnInterfaceAdded(void delegate(DBusInterfaceIF, DBusObjectIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	@property void delegate(DBusInterfaceIF, DBusObjectIF)[] onInterfaceRemovedListeners();
	/**
	 * Emitted when @interface is removed from @object.
	 *
	 * Params:
	 *     iface = The #GDBusInterface that was removed.
	 *
	 * Since: 2.30
	 */
	void addOnInterfaceRemoved(void delegate(DBusInterfaceIF, DBusObjectIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

}
