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


module gio.Mount;

private import gi.gio;
public  import gi.giotypes;
private import gio.MountIF;
private import gio.MountT;
private import gobject.ObjectG;


/** */
public class Mount : ObjectG, MountIF
{
	/** the main GObject struct */
	protected GMount* gMount;

	/** Get the main GObject struct */
	public GMount* getMountStruct()
	{
		return gMount;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gMount;
	}

	protected override void setStruct(GObject* obj)
	{
		gMount = cast(GMount*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GMount* gMount, bool ownedRef = false)
	{
		this.gMount = gMount;
		super(cast(GObject*)gMount, ownedRef);
	}

	// add the Mount capabilities
	mixin MountT!(GMount);

}
