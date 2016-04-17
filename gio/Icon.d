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


module gio.Icon;

private import gi.gio;
public  import gi.giotypes;
private import gio.IconIF;
private import gio.IconT;
private import gobject.ObjectG;


/** */
public class Icon : ObjectG, IconIF
{
	/** the main GObject struct */
	protected GIcon* gIcon;

	/** Get the main GObject struct */
	public GIcon* getIconStruct()
	{
		return gIcon;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gIcon;
	}

	protected override void setStruct(GObject* obj)
	{
		gIcon = cast(GIcon*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GIcon* gIcon, bool ownedRef = false)
	{
		this.gIcon = gIcon;
		super(cast(GObject*)gIcon, ownedRef);
	}

	// add the Icon capabilities
	mixin IconT!(GIcon);

}
