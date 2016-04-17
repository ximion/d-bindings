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


module appstream.MenuParser;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class MenuParser : ObjectG
{
	/** the main GObject struct */
	protected AsMenuParser* asMenuParser;

	/** Get the main GObject struct */
	public AsMenuParser* getMenuParserStruct()
	{
		return asMenuParser;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asMenuParser;
	}

	protected override void setStruct(GObject* obj)
	{
		asMenuParser = cast(AsMenuParser*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsMenuParser* asMenuParser, bool ownedRef = false)
	{
		this.asMenuParser = asMenuParser;
		super(cast(GObject*)asMenuParser, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_menu_parser_get_type();
	}

	/**
	 * Creates a new #AsMenuParser.
	 *
	 * Return: an #AsMenuParser.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_menu_parser_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsMenuParser*) p, true);
	}

	/**
	 * Creates a new #AsMenuParser using a custom XDG menu XML file.
	 *
	 * Params:
	 *     menuFile = The menu-file to parse.
	 *
	 * Return: an #AsMenuParser.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string menuFile)
	{
		auto p = as_menu_parser_new_from_file(Str.toStringz(menuFile));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_file");
		}
		
		this(cast(AsMenuParser*) p, true);
	}

	/** */
	public bool getUpdateCategoryData()
	{
		return as_menu_parser_get_update_category_data(asMenuParser) != 0;
	}

	/**
	 * Parse the menu file
	 *
	 * Return: #GList of #AsCategory objects found in the menu, or NULL if there was an error
	 */
	public ListG parse()
	{
		auto p = as_menu_parser_parse(asMenuParser);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListG(cast(GList*) p);
	}

	/** */
	public void setUpdateCategoryData(bool value)
	{
		as_menu_parser_set_update_category_data(asMenuParser, value);
	}
}
