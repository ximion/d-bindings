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


module gobject.TypePlugin;

private import gi.gobject;
public  import gi.gobjecttypes;
private import gobject.ObjectG;
private import gobject.TypePluginIF;
private import gobject.TypePluginT;


/** */
public class TypePlugin : ObjectG, TypePluginIF
{
	/** the main GObject struct */
	protected GTypePlugin* gTypePlugin;

	/** Get the main GObject struct */
	public GTypePlugin* getTypePluginStruct()
	{
		return gTypePlugin;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gTypePlugin;
	}

	protected override void setStruct(GObject* obj)
	{
		gTypePlugin = cast(GTypePlugin*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTypePlugin* gTypePlugin, bool ownedRef = false)
	{
		this.gTypePlugin = gTypePlugin;
		super(cast(GObject*)gTypePlugin, ownedRef);
	}

	// add the TypePlugin capabilities
	mixin TypePluginT!(GTypePlugin);

}
