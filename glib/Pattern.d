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


module glib.Pattern;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ConstructionException;
private import glib.Str;


/**
 * A GPatternSpec struct is the 'compiled' form of a pattern. This
 * structure is opaque and its fields cannot be accessed directly.
 */
public class Pattern
{
	/** the main GObject struct */
	protected GPatternSpec* gPatternSpec;

	/** Get the main GObject struct */
	public GPatternSpec* getPatternStruct()
	{
		return gPatternSpec;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gPatternSpec;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GPatternSpec* gPatternSpec)
	{
		this.gPatternSpec = gPatternSpec;
	}


	/**
	 * Compares two compiled pattern specs and returns whether they will
	 * match the same set of strings.
	 *
	 * Params:
	 *     pspec2 = another #GPatternSpec
	 *
	 * Return: Whether the compiled patterns are equal
	 */
	public bool equal(Pattern pspec2)
	{
		return g_pattern_spec_equal(gPatternSpec, (pspec2 is null) ? null : pspec2.getPatternStruct()) != 0;
	}

	/**
	 * Frees the memory allocated for the #GPatternSpec.
	 */
	public void free()
	{
		g_pattern_spec_free(gPatternSpec);
	}

	/**
	 * Compiles a pattern to a #GPatternSpec.
	 *
	 * Params:
	 *     pattern = a zero-terminated UTF-8 encoded string
	 *
	 * Return: a newly-allocated #GPatternSpec
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string pattern)
	{
		auto p = g_pattern_spec_new(Str.toStringz(pattern));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GPatternSpec*) p);
	}

	/**
	 * Matches a string against a compiled pattern. Passing the correct
	 * length of the string given is mandatory. The reversed string can be
	 * omitted by passing %NULL, this is more efficient if the reversed
	 * version of the string to be matched is not at hand, as
	 * g_pattern_match() will only construct it if the compiled pattern
	 * requires reverse matches.
	 *
	 * Note that, if the user code will (possibly) match a string against a
	 * multitude of patterns containing wildcards, chances are high that
	 * some patterns will require a reversed string. In this case, it's
	 * more efficient to provide the reversed string to avoid multiple
	 * constructions thereof in the various calls to g_pattern_match().
	 *
	 * Note also that the reverse of a UTF-8 encoded string can in general
	 * not be obtained by g_strreverse(). This works only if the string
	 * does not contain any multibyte characters. GLib offers the
	 * g_utf8_strreverse() function to reverse UTF-8 encoded strings.
	 *
	 * Params:
	 *     pspec = a #GPatternSpec
	 *     stringLength = the length of @string (in bytes, i.e. strlen(),
	 *         not g_utf8_strlen())
	 *     str = the UTF-8 encoded string to match
	 *     stringReversed = the reverse of @string or %NULL
	 *
	 * Return: %TRUE if @string matches @pspec
	 */
	public static bool patternMatch(Pattern pspec, uint stringLength, string str, string stringReversed)
	{
		return g_pattern_match((pspec is null) ? null : pspec.getPatternStruct(), stringLength, Str.toStringz(str), Str.toStringz(stringReversed)) != 0;
	}

	/**
	 * Matches a string against a pattern given as a string. If this
	 * function is to be called in a loop, it's more efficient to compile
	 * the pattern once with g_pattern_spec_new() and call
	 * g_pattern_match_string() repeatedly.
	 *
	 * Params:
	 *     pattern = the UTF-8 encoded pattern
	 *     str = the UTF-8 encoded string to match
	 *
	 * Return: %TRUE if @string matches @pspec
	 */
	public static bool patternMatchSimple(string pattern, string str)
	{
		return g_pattern_match_simple(Str.toStringz(pattern), Str.toStringz(str)) != 0;
	}

	/**
	 * Matches a string against a compiled pattern. If the string is to be
	 * matched against more than one pattern, consider using
	 * g_pattern_match() instead while supplying the reversed string.
	 *
	 * Params:
	 *     pspec = a #GPatternSpec
	 *     str = the UTF-8 encoded string to match
	 *
	 * Return: %TRUE if @string matches @pspec
	 */
	public static bool patternMatchString(Pattern pspec, string str)
	{
		return g_pattern_match_string((pspec is null) ? null : pspec.getPatternStruct(), Str.toStringz(str)) != 0;
	}
}
