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


module gio.EmblemedIcon;

private import gi.gio;
public  import gi.giotypes;
private import gio.Emblem;
private import gio.Icon;
private import gio.IconIF;
private import gio.IconT;
private import glib.ConstructionException;
private import glib.ListG;
private import gobject.ObjectG;


/**
 * #GEmblemedIcon is an implementation of #GIcon that supports
 * adding an emblem to an icon. Adding multiple emblems to an
 * icon is ensured via g_emblemed_icon_add_emblem().
 * 
 * Note that #GEmblemedIcon allows no control over the position
 * of the emblems. See also #GEmblem for more information.
 */
public class EmblemedIcon : ObjectG, IconIF
{
	/** the main GObject struct */
	protected GEmblemedIcon* gEmblemedIcon;

	/** Get the main GObject struct */
	public GEmblemedIcon* getEmblemedIconStruct()
	{
		return gEmblemedIcon;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gEmblemedIcon;
	}

	protected override void setStruct(GObject* obj)
	{
		gEmblemedIcon = cast(GEmblemedIcon*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GEmblemedIcon* gEmblemedIcon, bool ownedRef = false)
	{
		this.gEmblemedIcon = gEmblemedIcon;
		super(cast(GObject*)gEmblemedIcon, ownedRef);
	}

	// add the Icon capabilities
	mixin IconT!(GEmblemedIcon);


	/** */
	public static GType getType()
	{
		return g_emblemed_icon_get_type();
	}

	/**
	 * Creates a new emblemed icon for @icon with the emblem @emblem.
	 *
	 * Params:
	 *     icon = a #GIcon
	 *     emblem = a #GEmblem, or %NULL
	 *
	 * Return: a new #GIcon
	 *
	 * Since: 2.18
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(IconIF icon, Emblem emblem)
	{
		auto p = g_emblemed_icon_new((icon is null) ? null : icon.getIconStruct(), (emblem is null) ? null : emblem.getEmblemStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GEmblemedIcon*) p, true);
	}

	/**
	 * Adds @emblem to the #GList of #GEmblems.
	 *
	 * Params:
	 *     emblem = a #GEmblem
	 *
	 * Since: 2.18
	 */
	public void addEmblem(Emblem emblem)
	{
		g_emblemed_icon_add_emblem(gEmblemedIcon, (emblem is null) ? null : emblem.getEmblemStruct());
	}

	/**
	 * Removes all the emblems from @icon.
	 *
	 * Since: 2.28
	 */
	public void clearEmblems()
	{
		g_emblemed_icon_clear_emblems(gEmblemedIcon);
	}

	/**
	 * Gets the list of emblems for the @icon.
	 *
	 * Return: a #GList of
	 *     #GEmblems that is owned by @emblemed
	 *
	 * Since: 2.18
	 */
	public ListG getEmblems()
	{
		auto p = g_emblemed_icon_get_emblems(gEmblemedIcon);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListG(cast(GList*) p);
	}

	/**
	 * Gets the main icon for @emblemed.
	 *
	 * Return: a #GIcon that is owned by @emblemed
	 *
	 * Since: 2.18
	 */
	public IconIF getIcon()
	{
		auto p = g_emblemed_icon_get_icon(gEmblemedIcon);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}
}
