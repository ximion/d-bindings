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


module appstream.Category;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Category : ObjectG
{
	/** the main GObject struct */
	protected AsCategory* asCategory;

	/** Get the main GObject struct */
	public AsCategory* getCategoryStruct()
	{
		return asCategory;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asCategory;
	}

	protected override void setStruct(GObject* obj)
	{
		asCategory = cast(AsCategory*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsCategory* asCategory, bool ownedRef = false)
	{
		this.asCategory = asCategory;
		super(cast(GObject*)asCategory, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_category_get_type();
	}

	/**
	 * Creates a new #AsCategory.
	 *
	 * Return: a new #AsCategory
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_category_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsCategory*) p, true);
	}

	/**
	 * Add a subcategory to this category.
	 *
	 * Params:
	 *     subcat = A subcategory to add.
	 */
	public void addChild(Category subcat)
	{
		as_category_add_child(asCategory, (subcat is null) ? null : subcat.getCategoryStruct());
	}

	/**
	 * Add a desktop-file category to this #AsCategory.
	 *
	 * Params:
	 *     groupName = A subcategory to add.
	 */
	public void addDesktopGroup(string groupName)
	{
		as_category_add_desktop_group(asCategory, Str.toStringz(groupName));
	}

	/**
	 * Return: A list of subcategories.
	 */
	public PtrArray getChildren()
	{
		auto p = as_category_get_children(asCategory);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Return: A list of desktop-file categories.
	 */
	public PtrArray getDesktopGroups()
	{
		auto p = as_category_get_desktop_groups(asCategory);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Get the stock icon name for this category.
	 */
	public string getIcon()
	{
		return Str.toString(as_category_get_icon(asCategory));
	}

	/**
	 * Get the ID of this category.
	 */
	public string getId()
	{
		return Str.toString(as_category_get_id(asCategory));
	}

	/**
	 * Get the name of this category.
	 */
	public string getName()
	{
		return Str.toString(as_category_get_name(asCategory));
	}

	/**
	 * Get the summary (short description) of this category.
	 */
	public string getSummary()
	{
		return Str.toString(as_category_get_summary(asCategory));
	}

	/**
	 * Test for sub-categories.
	 *
	 * Return: %TRUE if this category has any subcategory
	 */
	public bool hasChildren()
	{
		return as_category_has_children(asCategory) != 0;
	}

	/**
	 * Drop a subcategory from this #AsCategory.
	 *
	 * Params:
	 *     subcat = A subcategory to remove.
	 */
	public void removeChild(Category subcat)
	{
		as_category_remove_child(asCategory, (subcat is null) ? null : subcat.getCategoryStruct());
	}

	/**
	 * Set the stock icon name for this category.
	 */
	public void setIcon(string value)
	{
		as_category_set_icon(asCategory, Str.toStringz(value));
	}

	/**
	 * Set the ID of this category.
	 */
	public void setId(string id)
	{
		as_category_set_id(asCategory, Str.toStringz(id));
	}

	/**
	 * Set the name of this category.
	 */
	public void setName(string value)
	{
		as_category_set_name(asCategory, Str.toStringz(value));
	}

	/**
	 * Get the summary (short description) of this category.
	 *
	 * Params:
	 *     value = A new short summary of this category.
	 */
	public void setSummary(string value)
	{
		as_category_set_summary(asCategory, Str.toStringz(value));
	}
}
