/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module glib.Once;

private import gi.glib;
public  import gi.glibtypes;


/**
 * A #GOnce struct controls a one-time initialization function. Any
 * one-time initialization function must have its own unique #GOnce
 * struct.
 *
 * Since: 2.4
 */
public class Once
{
	/** the main GObject struct */
	protected GOnce* gOnce;

	/** Get the main GObject struct */
	public GOnce* getOnceStruct()
	{
		return gOnce;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gOnce;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GOnce* gOnce)
	{
		this.gOnce = gOnce;
	}


	/** */
	public void* impl(GThreadFunc func, void* arg)
	{
		return g_once_impl(gOnce, func, arg);
	}

	/**
	 * Function to be called when starting a critical initialization
	 * section. The argument @location must point to a static
	 * 0-initialized variable that will be set to a value other than 0 at
	 * the end of the initialization section. In combination with
	 * g_once_init_leave() and the unique address @value_location, it can
	 * be ensured that an initialization section will be executed only once
	 * during a program's life time, and that concurrent threads are
	 * blocked until initialization completed. To be used in constructs
	 * like this:
	 *
	 * |[<!-- language="C" -->
	 * static gsize initialization_value = 0;
	 *
	 * if (g_once_init_enter (&initialization_value))
	 * {
	 * gsize setup_value = 42; // initialization code here
	 *
	 * g_once_init_leave (&initialization_value, setup_value);
	 * }
	 *
	 * // use initialization_value here
	 * ]|
	 *
	 * Params:
	 *     location = location of a static initializable variable containing 0
	 *
	 * Return: %TRUE if the initialization section should be entered,
	 *     %FALSE and blocks otherwise
	 *
	 * Since: 2.14
	 */
	public static bool initEnter(void* location)
	{
		return g_once_init_enter(location) != 0;
	}

	/**
	 * Counterpart to g_once_init_enter(). Expects a location of a static
	 * 0-initialized initialization variable, and an initialization value
	 * other than 0. Sets the variable to the initialization value, and
	 * releases concurrent threads blocking in g_once_init_enter() on this
	 * initialization variable.
	 *
	 * Params:
	 *     location = location of a static initializable variable containing 0
	 *     result = new non-0 value for *@value_location
	 *
	 * Since: 2.14
	 */
	public static void initLeave(void* location, size_t result)
	{
		g_once_init_leave(location, result);
	}
}
