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


module gio.FileAttributeMatcher;

private import gi.gio;
public  import gi.giotypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * Determines if a string matches a file attribute.
 */
public class FileAttributeMatcher
{
	/** the main GObject struct */
	protected GFileAttributeMatcher* gFileAttributeMatcher;

	/** Get the main GObject struct */
	public GFileAttributeMatcher* getFileAttributeMatcherStruct()
	{
		return gFileAttributeMatcher;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gFileAttributeMatcher;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFileAttributeMatcher* gFileAttributeMatcher)
	{
		this.gFileAttributeMatcher = gFileAttributeMatcher;
	}


	/** */
	public static GType getType()
	{
		return g_file_attribute_matcher_get_type();
	}

	/**
	 * Creates a new file attribute matcher, which matches attributes
	 * against a given string. #GFileAttributeMatchers are reference
	 * counted structures, and are created with a reference count of 1. If
	 * the number of references falls to 0, the #GFileAttributeMatcher is
	 * automatically destroyed.
	 *
	 * The @attribute string should be formatted with specific keys separated
	 * from namespaces with a double colon. Several "namespace::key" strings may be
	 * concatenated with a single comma (e.g. "standard::type,standard::is-hidden").
	 * The wildcard "*" may be used to match all keys and namespaces, or
	 * "namespace::*" will match all keys in a given namespace.
	 *
	 * ## Examples of file attribute matcher strings and results
	 *
	 * - `"*"`: matches all attributes.
	 * - `"standard::is-hidden"`: matches only the key is-hidden in the
	 * standard namespace.
	 * - `"standard::type,unix::*"`: matches the type key in the standard
	 * namespace and all keys in the unix namespace.
	 *
	 * Params:
	 *     attributes = an attribute string to match.
	 *
	 * Return: a #GFileAttributeMatcher
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string attributes)
	{
		auto p = g_file_attribute_matcher_new(Str.toStringz(attributes));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GFileAttributeMatcher*) p);
	}

	/**
	 * Checks if the matcher will match all of the keys in a given namespace.
	 * This will always return %TRUE if a wildcard character is in use (e.g. if
	 * matcher was created with "standard::*" and @ns is "standard", or if matcher was created
	 * using "*" and namespace is anything.)
	 *
	 * TODO: this is awkwardly worded.
	 *
	 * Params:
	 *     ns = a string containing a file attribute namespace.
	 *
	 * Return: %TRUE if the matcher matches all of the entries
	 *     in the given @ns, %FALSE otherwise.
	 */
	public bool enumerateNamespace(string ns)
	{
		return g_file_attribute_matcher_enumerate_namespace(gFileAttributeMatcher, Str.toStringz(ns)) != 0;
	}

	/**
	 * Gets the next matched attribute from a #GFileAttributeMatcher.
	 *
	 * Return: a string containing the next attribute or %NULL if
	 *     no more attribute exist.
	 */
	public string enumerateNext()
	{
		return Str.toString(g_file_attribute_matcher_enumerate_next(gFileAttributeMatcher));
	}

	/**
	 * Checks if an attribute will be matched by an attribute matcher. If
	 * the matcher was created with the "*" matching string, this function
	 * will always return %TRUE.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: %TRUE if @attribute matches @matcher. %FALSE otherwise.
	 */
	public bool matches(string attribute)
	{
		return g_file_attribute_matcher_matches(gFileAttributeMatcher, Str.toStringz(attribute)) != 0;
	}

	/**
	 * Checks if a attribute matcher only matches a given attribute. Always
	 * returns %FALSE if "*" was used when creating the matcher.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: %TRUE if the matcher only matches @attribute. %FALSE otherwise.
	 */
	public bool matchesOnly(string attribute)
	{
		return g_file_attribute_matcher_matches_only(gFileAttributeMatcher, Str.toStringz(attribute)) != 0;
	}

	/**
	 * References a file attribute matcher.
	 *
	 * Return: a #GFileAttributeMatcher.
	 */
	public FileAttributeMatcher doref()
	{
		auto p = g_file_attribute_matcher_ref(gFileAttributeMatcher);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(FileAttributeMatcher)(cast(GFileAttributeMatcher*) p);
	}

	/**
	 * Subtracts all attributes of @subtract from @matcher and returns
	 * a matcher that supports those attributes.
	 *
	 * Note that currently it is not possible to remove a single
	 * attribute when the @matcher matches the whole namespace - or remove
	 * a namespace or attribute when the matcher matches everything. This
	 * is a limitation of the current implementation, but may be fixed
	 * in the future.
	 *
	 * Params:
	 *     subtract = The matcher to subtract
	 *
	 * Return: A file attribute matcher matching all attributes of
	 *     @matcher that are not matched by @subtract
	 */
	public FileAttributeMatcher subtract(FileAttributeMatcher subtract)
	{
		auto p = g_file_attribute_matcher_subtract(gFileAttributeMatcher, (subtract is null) ? null : subtract.getFileAttributeMatcherStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(FileAttributeMatcher)(cast(GFileAttributeMatcher*) p);
	}

	/**
	 * Prints what the matcher is matching against. The format will be
	 * equal to the format passed to g_file_attribute_matcher_new().
	 * The output however, might not be identical, as the matcher may
	 * decide to use a different order or omit needless parts.
	 *
	 * Return: a string describing the attributes the matcher matches
	 *     against or %NULL if @matcher was %NULL.
	 *
	 * Since: 2.32
	 */
	public override string toString()
	{
		return Str.toString(g_file_attribute_matcher_to_string(gFileAttributeMatcher));
	}

	/**
	 * Unreferences @matcher. If the reference count falls below 1,
	 * the @matcher is automatically freed.
	 */
	public void unref()
	{
		g_file_attribute_matcher_unref(gFileAttributeMatcher);
	}
}
