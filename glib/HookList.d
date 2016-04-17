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


module glib.HookList;

private import gi.glib;
public  import gi.glibtypes;


/**
 * The #GHookList struct represents a list of hook functions.
 */
public class HookList
{
	/** the main GObject struct */
	protected GHookList* gHookList;

	/** Get the main GObject struct */
	public GHookList* getHookListStruct()
	{
		return gHookList;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gHookList;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GHookList* gHookList)
	{
		this.gHookList = gHookList;
	}


	/**
	 * Removes all the #GHook elements from a #GHookList.
	 */
	public void clear()
	{
		g_hook_list_clear(gHookList);
	}

	/**
	 * Initializes a #GHookList.
	 * This must be called before the #GHookList is used.
	 *
	 * Params:
	 *     hookSize = the size of each element in the #GHookList,
	 *         typically `sizeof (GHook)`.
	 */
	public void init(uint hookSize)
	{
		g_hook_list_init(gHookList, hookSize);
	}

	/**
	 * Calls all of the #GHook functions in a #GHookList.
	 *
	 * Params:
	 *     mayRecurse = %TRUE if functions which are already running
	 *         (e.g. in another thread) can be called. If set to %FALSE,
	 *         these are skipped
	 */
	public void invoke(bool mayRecurse)
	{
		g_hook_list_invoke(gHookList, mayRecurse);
	}

	/**
	 * Calls all of the #GHook functions in a #GHookList.
	 * Any function which returns %FALSE is removed from the #GHookList.
	 *
	 * Params:
	 *     mayRecurse = %TRUE if functions which are already running
	 *         (e.g. in another thread) can be called. If set to %FALSE,
	 *         these are skipped
	 */
	public void invokeCheck(bool mayRecurse)
	{
		g_hook_list_invoke_check(gHookList, mayRecurse);
	}

	/**
	 * Calls a function on each valid #GHook.
	 *
	 * Params:
	 *     mayRecurse = %TRUE if hooks which are currently running
	 *         (e.g. in another thread) are considered valid. If set to %FALSE,
	 *         these are skipped
	 *     marshaller = the function to call for each #GHook
	 *     marshalData = data to pass to @marshaller
	 */
	public void marshal(bool mayRecurse, GHookMarshaller marshaller, void* marshalData)
	{
		g_hook_list_marshal(gHookList, mayRecurse, marshaller, marshalData);
	}

	/**
	 * Calls a function on each valid #GHook and destroys it if the
	 * function returns %FALSE.
	 *
	 * Params:
	 *     mayRecurse = %TRUE if hooks which are currently running
	 *         (e.g. in another thread) are considered valid. If set to %FALSE,
	 *         these are skipped
	 *     marshaller = the function to call for each #GHook
	 *     marshalData = data to pass to @marshaller
	 */
	public void marshalCheck(bool mayRecurse, GHookCheckMarshaller marshaller, void* marshalData)
	{
		g_hook_list_marshal_check(gHookList, mayRecurse, marshaller, marshalData);
	}
}
