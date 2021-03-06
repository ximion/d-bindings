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


module glib.Private;

private import gi.glib;
public  import gi.glibtypes;


/**
 * The #GPrivate struct is an opaque data structure to represent a
 * thread-local data key. It is approximately equivalent to the
 * pthread_setspecific()/pthread_getspecific() APIs on POSIX and to
 * TlsSetValue()/TlsGetValue() on Windows.
 * 
 * If you don't already know why you might want this functionality,
 * then you probably don't need it.
 * 
 * #GPrivate is a very limited resource (as far as 128 per program,
 * shared between all libraries). It is also not possible to destroy a
 * #GPrivate after it has been used. As such, it is only ever acceptable
 * to use #GPrivate in static scope, and even then sparingly so.
 * 
 * See G_PRIVATE_INIT() for a couple of examples.
 * 
 * The #GPrivate structure should be considered opaque.  It should only
 * be accessed via the g_private_ functions.
 */
public class Private
{
	/** the main GObject struct */
	protected GPrivate* gPrivate;

	/** Get the main GObject struct */
	public GPrivate* getPrivateStruct()
	{
		return gPrivate;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gPrivate;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GPrivate* gPrivate)
	{
		this.gPrivate = gPrivate;
	}


	/**
	 * Returns the current value of the thread local variable @key.
	 *
	 * If the value has not yet been set in this thread, %NULL is returned.
	 * Values are never copied between threads (when a new thread is
	 * created, for example).
	 *
	 * Return: the thread-local value
	 */
	public void* get()
	{
		return g_private_get(gPrivate);
	}

	/**
	 * Sets the thread local variable @key to have the value @value in the
	 * current thread.
	 *
	 * This function differs from g_private_set() in the following way: if
	 * the previous value was non-%NULL then the #GDestroyNotify handler for
	 * @key is run on it.
	 *
	 * Params:
	 *     value = the new value
	 *
	 * Since: 2.32
	 */
	public void replace(void* value)
	{
		g_private_replace(gPrivate, value);
	}

	/**
	 * Sets the thread local variable @key to have the value @value in the
	 * current thread.
	 *
	 * This function differs from g_private_replace() in the following way:
	 * the #GDestroyNotify for @key is not called on the old value.
	 *
	 * Params:
	 *     value = the new value
	 */
	public void set(void* value)
	{
		g_private_set(gPrivate, value);
	}
}
