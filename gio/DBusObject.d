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


module gio.DBusObject;

private import gi.gio;
public  import gi.giotypes;
private import gio.DBusObjectIF;
private import gio.DBusObjectT;
private import gobject.ObjectG;


/** */
public class DBusObject : ObjectG, DBusObjectIF
{
	/** the main GObject struct */
	protected GDBusObject* gDBusObject;

	/** Get the main GObject struct */
	public GDBusObject* getDBusObjectStruct()
	{
		return gDBusObject;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gDBusObject;
	}

	protected override void setStruct(GObject* obj)
	{
		gDBusObject = cast(GDBusObject*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDBusObject* gDBusObject, bool ownedRef = false)
	{
		this.gDBusObject = gDBusObject;
		super(cast(GObject*)gDBusObject, ownedRef);
	}

	// add the DBusObject capabilities
	mixin DBusObjectT!(GDBusObject);

}
