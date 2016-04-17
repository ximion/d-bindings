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


module gio.DBusObjectSkeleton;

private import gi.gio;
public  import gi.giotypes;
private import gio.DBusInterfaceSkeleton;
private import gio.DBusMethodInvocation;
private import gio.DBusObjectIF;
private import gio.DBusObjectT;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;


/**
 * A #GDBusObjectSkeleton instance is essentially a group of D-Bus
 * interfaces. The set of exported interfaces on the object may be
 * dynamic and change at runtime.
 * 
 * This type is intended to be used with #GDBusObjectManager.
 *
 * Since: 2.30
 */
public class DBusObjectSkeleton : ObjectG, DBusObjectIF
{
	/** the main GObject struct */
	protected GDBusObjectSkeleton* gDBusObjectSkeleton;

	/** Get the main GObject struct */
	public GDBusObjectSkeleton* getDBusObjectSkeletonStruct()
	{
		return gDBusObjectSkeleton;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gDBusObjectSkeleton;
	}

	protected override void setStruct(GObject* obj)
	{
		gDBusObjectSkeleton = cast(GDBusObjectSkeleton*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDBusObjectSkeleton* gDBusObjectSkeleton, bool ownedRef = false)
	{
		this.gDBusObjectSkeleton = gDBusObjectSkeleton;
		super(cast(GObject*)gDBusObjectSkeleton, ownedRef);
	}

	// add the DBusObject capabilities
	mixin DBusObjectT!(GDBusObjectSkeleton);


	/** */
	public static GType getType()
	{
		return g_dbus_object_skeleton_get_type();
	}

	/**
	 * Creates a new #GDBusObjectSkeleton.
	 *
	 * Params:
	 *     objectPath = An object path.
	 *
	 * Return: A #GDBusObjectSkeleton. Free with g_object_unref().
	 *
	 * Since: 2.30
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string objectPath)
	{
		auto p = g_dbus_object_skeleton_new(Str.toStringz(objectPath));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GDBusObjectSkeleton*) p, true);
	}

	/**
	 * Adds @interface_ to @object.
	 *
	 * If @object already contains a #GDBusInterfaceSkeleton with the same
	 * interface name, it is removed before @interface_ is added.
	 *
	 * Note that @object takes its own reference on @interface_ and holds
	 * it until removed.
	 *
	 * Params:
	 *     iface = A #GDBusInterfaceSkeleton.
	 *
	 * Since: 2.30
	 */
	public void addInterface(DBusInterfaceSkeleton iface)
	{
		g_dbus_object_skeleton_add_interface(gDBusObjectSkeleton, (iface is null) ? null : iface.getDBusInterfaceSkeletonStruct());
	}

	/**
	 * This method simply calls g_dbus_interface_skeleton_flush() on all
	 * interfaces belonging to @object. See that method for when flushing
	 * is useful.
	 *
	 * Since: 2.30
	 */
	public void flush()
	{
		g_dbus_object_skeleton_flush(gDBusObjectSkeleton);
	}

	/**
	 * Removes @interface_ from @object.
	 *
	 * Params:
	 *     iface = A #GDBusInterfaceSkeleton.
	 *
	 * Since: 2.30
	 */
	public void removeInterface(DBusInterfaceSkeleton iface)
	{
		g_dbus_object_skeleton_remove_interface(gDBusObjectSkeleton, (iface is null) ? null : iface.getDBusInterfaceSkeletonStruct());
	}

	/**
	 * Removes the #GDBusInterface with @interface_name from @object.
	 *
	 * If no D-Bus interface of the given interface exists, this function
	 * does nothing.
	 *
	 * Params:
	 *     interfaceName = A D-Bus interface name.
	 *
	 * Since: 2.30
	 */
	public void removeInterfaceByName(string interfaceName)
	{
		g_dbus_object_skeleton_remove_interface_by_name(gDBusObjectSkeleton, Str.toStringz(interfaceName));
	}

	/**
	 * Sets the object path for @object.
	 *
	 * Params:
	 *     objectPath = A valid D-Bus object path.
	 *
	 * Since: 2.30
	 */
	public void setObjectPath(string objectPath)
	{
		g_dbus_object_skeleton_set_object_path(gDBusObjectSkeleton, Str.toStringz(objectPath));
	}

	int[string] connectedSignals;

	bool delegate(DBusInterfaceSkeleton, DBusMethodInvocation, DBusObjectSkeleton)[] onAuthorizeMethodListeners;
	/**
	 * Emitted when a method is invoked by a remote caller and used to
	 * determine if the method call is authorized.
	 *
	 * This signal is like #GDBusInterfaceSkeleton's
	 * #GDBusInterfaceSkeleton::g-authorize-method signal,
	 * except that it is for the enclosing object.
	 *
	 * The default class handler just returns %TRUE.
	 *
	 * Params:
	 *     iface = The #GDBusInterfaceSkeleton that @invocation is for.
	 *     invocation = A #GDBusMethodInvocation.
	 *
	 * Return: %TRUE if the call is authorized, %FALSE otherwise.
	 *
	 * Since: 2.30
	 */
	void addOnAuthorizeMethod(bool delegate(DBusInterfaceSkeleton, DBusMethodInvocation, DBusObjectSkeleton) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "authorize-method" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"authorize-method",
				cast(GCallback)&callBackAuthorizeMethod,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["authorize-method"] = 1;
		}
		onAuthorizeMethodListeners ~= dlg;
	}
	extern(C) static int callBackAuthorizeMethod(GDBusObjectSkeleton* dbusobjectskeletonStruct, GDBusInterfaceSkeleton* iface, GDBusMethodInvocation* invocation, DBusObjectSkeleton _dbusobjectskeleton)
	{
		foreach ( bool delegate(DBusInterfaceSkeleton, DBusMethodInvocation, DBusObjectSkeleton) dlg; _dbusobjectskeleton.onAuthorizeMethodListeners )
		{
			if ( dlg(ObjectG.getDObject!(DBusInterfaceSkeleton)(iface), ObjectG.getDObject!(DBusMethodInvocation)(invocation), _dbusobjectskeleton) )
			{
				return 1;
			}
		}
		
		return 0;
	}
}
