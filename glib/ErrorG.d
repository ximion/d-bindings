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


module glib.ErrorG;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ConstructionException;
private import glib.Str;


/**
 * The `GError` structure contains information about
 * an error that has occurred.
 */
public class ErrorG
{
	/** the main GObject struct */
	protected GError* gError;

	/** Get the main GObject struct */
	public GError* getErrorGStruct()
	{
		return gError;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gError;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GError* gError)
	{
		this.gError = gError;
	}


	/**
	 * Creates a new #GError; unlike g_error_new(), @message is
	 * not a printf()-style format string. Use this function if
	 * @message contains text you don't have control over,
	 * that could include printf() escape sequences.
	 *
	 * Params:
	 *     domain = error domain
	 *     code = error code
	 *     message = error message
	 *
	 * Return: a new #GError
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(GQuark domain, int code, string message)
	{
		auto p = g_error_new_literal(domain, code, Str.toStringz(message));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_literal");
		}
		
		this(cast(GError*) p);
	}

	/**
	 * Creates a new #GError with the given @domain and @code,
	 * and a message formatted with @format.
	 *
	 * Params:
	 *     domain = error domain
	 *     code = error code
	 *     format = printf()-style format for error message
	 *     args = #va_list of parameters for the message format
	 *
	 * Return: a new #GError
	 *
	 * Since: 2.22
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(GQuark domain, int code, string format, void* args)
	{
		auto p = g_error_new_valist(domain, code, Str.toStringz(format), args);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_valist");
		}
		
		this(cast(GError*) p);
	}

	/**
	 * Makes a copy of @error.
	 *
	 * Return: a new #GError
	 */
	public ErrorG copy()
	{
		auto p = g_error_copy(gError);
		
		if(p is null)
		{
			return null;
		}
		
		return new ErrorG(cast(GError*) p);
	}

	/**
	 * Frees a #GError and associated resources.
	 */
	public void free()
	{
		g_error_free(gError);
	}

	/**
	 * Returns %TRUE if @error matches @domain and @code, %FALSE
	 * otherwise. In particular, when @error is %NULL, %FALSE will
	 * be returned.
	 *
	 * If @domain contains a `FAILED` (or otherwise generic) error code,
	 * you should generally not check for it explicitly, but should
	 * instead treat any not-explicitly-recognized error code as being
	 * equivalent to the `FAILED` code. This way, if the domain is
	 * extended in the future to provide a more specific error code for
	 * a certain case, your code will still work.
	 *
	 * Params:
	 *     domain = an error domain
	 *     code = an error code
	 *
	 * Return: whether @error has @domain and @code
	 */
	public bool matches(GQuark domain, int code)
	{
		return g_error_matches(gError, domain, code) != 0;
	}

	/**
	 * If @dest is %NULL, free @src; otherwise, moves @src into *@dest.
	 * The error variable @dest points to must be %NULL.
	 *
	 * Note that @src is no longer valid after this call. If you want
	 * to keep using the same GError*, you need to set it to %NULL
	 * after calling this function on it.
	 *
	 * Params:
	 *     dest = error return location
	 *     src = error to move into the return location
	 */
	public static void propagateError(out ErrorG dest, ErrorG src)
	{
		GError* outdest = null;
		
		g_propagate_error(&outdest, (src is null) ? null : src.getErrorGStruct());
		
		dest = new ErrorG(outdest);
	}

	/**
	 * Does nothing if @err is %NULL; if @err is non-%NULL, then *@err
	 * must be %NULL. A new #GError is created and assigned to *@err.
	 * Unlike g_set_error(), @message is not a printf()-style format string.
	 * Use this function if @message contains text you don't have control over,
	 * that could include printf() escape sequences.
	 *
	 * Params:
	 *     err = a return location for a #GError, or %NULL
	 *     domain = error domain
	 *     code = error code
	 *     message = error message
	 *
	 * Since: 2.18
	 */
	public static void setErrorLiteral(out ErrorG err, GQuark domain, int code, string message)
	{
		GError* outerr = null;
		
		g_set_error_literal(&outerr, domain, code, Str.toStringz(message));
		
		err = new ErrorG(outerr);
	}
}
