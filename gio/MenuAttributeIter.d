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


module gio.MenuAttributeIter;

private import gi.gio;
public  import gi.giotypes;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;


/**
 * #GMenuAttributeIter is an opaque structure type.  You must access it
 * using the functions below.
 *
 * Since: 2.32
 */
public class MenuAttributeIter : ObjectG
{
	/** the main GObject struct */
	protected GMenuAttributeIter* gMenuAttributeIter;

	/** Get the main GObject struct */
	public GMenuAttributeIter* getMenuAttributeIterStruct()
	{
		return gMenuAttributeIter;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gMenuAttributeIter;
	}

	protected override void setStruct(GObject* obj)
	{
		gMenuAttributeIter = cast(GMenuAttributeIter*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GMenuAttributeIter* gMenuAttributeIter, bool ownedRef = false)
	{
		this.gMenuAttributeIter = gMenuAttributeIter;
		super(cast(GObject*)gMenuAttributeIter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_menu_attribute_iter_get_type();
	}

	/**
	 * Gets the name of the attribute at the current iterator position, as
	 * a string.
	 *
	 * The iterator is not advanced.
	 *
	 * Return: the name of the attribute
	 *
	 * Since: 2.32
	 */
	public string getName()
	{
		return Str.toString(g_menu_attribute_iter_get_name(gMenuAttributeIter));
	}

	/**
	 * This function combines g_menu_attribute_iter_next() with
	 * g_menu_attribute_iter_get_name() and g_menu_attribute_iter_get_value().
	 *
	 * First the iterator is advanced to the next (possibly first) attribute.
	 * If that fails, then %FALSE is returned and there are no other
	 * effects.
	 *
	 * If successful, @name and @value are set to the name and value of the
	 * attribute that has just been advanced to.  At this point,
	 * g_menu_attribute_iter_get_name() and g_menu_attribute_iter_get_value() will
	 * return the same values again.
	 *
	 * The value returned in @name remains valid for as long as the iterator
	 * remains at the current position.  The value returned in @value must
	 * be unreffed using g_variant_unref() when it is no longer in use.
	 *
	 * Params:
	 *     outName = the type of the attribute
	 *     value = the attribute value
	 *
	 * Return: %TRUE on success, or %FALSE if there is no additional
	 *     attribute
	 *
	 * Since: 2.32
	 */
	public bool getNext(out string outName, out Variant value)
	{
		char* outoutName = null;
		GVariant* outvalue = null;
		
		auto p = g_menu_attribute_iter_get_next(gMenuAttributeIter, &outoutName, &outvalue) != 0;
		
		outName = Str.toString(outoutName);
		value = new Variant(outvalue);
		
		return p;
	}

	/**
	 * Gets the value of the attribute at the current iterator position.
	 *
	 * The iterator is not advanced.
	 *
	 * Return: the value of the current attribute
	 *
	 * Since: 2.32
	 */
	public Variant getValue()
	{
		auto p = g_menu_attribute_iter_get_value(gMenuAttributeIter);
		
		if(p is null)
		{
			return null;
		}
		
		return new Variant(cast(GVariant*) p);
	}

	/**
	 * Attempts to advance the iterator to the next (possibly first)
	 * attribute.
	 *
	 * %TRUE is returned on success, or %FALSE if there are no more
	 * attributes.
	 *
	 * You must call this function when you first acquire the iterator
	 * to advance it to the first attribute (and determine if the first
	 * attribute exists at all).
	 *
	 * Return: %TRUE on success, or %FALSE when there are no more attributes
	 *
	 * Since: 2.32
	 */
	public bool next()
	{
		return g_menu_attribute_iter_next(gMenuAttributeIter) != 0;
	}
}
