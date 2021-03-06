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


module gio.Action;

private import gi.gio;
public  import gi.giotypes;
private import gio.ActionIF;
private import gio.ActionT;
private import gobject.ObjectG;


/** */
public class Action : ObjectG, ActionIF
{
	/** the main GObject struct */
	protected GAction* gAction;

	/** Get the main GObject struct */
	public GAction* getActionStruct()
	{
		return gAction;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gAction;
	}

	protected override void setStruct(GObject* obj)
	{
		gAction = cast(GAction*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GAction* gAction, bool ownedRef = false)
	{
		this.gAction = gAction;
		super(cast(GObject*)gAction, ownedRef);
	}

	// add the Action capabilities
	mixin ActionT!(GAction);

}
