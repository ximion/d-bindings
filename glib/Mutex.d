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


module glib.Mutex;

private import gi.glib;
public  import gi.glibtypes;


/**
 * The #GMutex struct is an opaque data structure to represent a mutex
 * (mutual exclusion). It can be used to protect data against shared
 * access.
 * 
 * Take for example the following function:
 * |[<!-- language="C" -->
 * int
 * give_me_next_number (void)
 * {
 * static int current_number = 0;
 * 
 * // now do a very complicated calculation to calculate the new
 * // number, this might for example be a random number generator
 * current_number = calc_next_number (current_number);
 * 
 * return current_number;
 * }
 * ]|
 * It is easy to see that this won't work in a multi-threaded
 * application. There current_number must be protected against shared
 * access. A #GMutex can be used as a solution to this problem:
 * |[<!-- language="C" -->
 * int
 * give_me_next_number (void)
 * {
 * static GMutex mutex;
 * static int current_number = 0;
 * int ret_val;
 * 
 * g_mutex_lock (&mutex);
 * ret_val = current_number = calc_next_number (current_number);
 * g_mutex_unlock (&mutex);
 * 
 * return ret_val;
 * }
 * ]|
 * Notice that the #GMutex is not initialised to any particular value.
 * Its placement in static storage ensures that it will be initialised
 * to all-zeros, which is appropriate.
 * 
 * If a #GMutex is placed in other contexts (eg: embedded in a struct)
 * then it must be explicitly initialised using g_mutex_init().
 * 
 * A #GMutex should only be accessed via g_mutex_ functions.
 */
public class Mutex
{
	/** the main GObject struct */
	protected GMutex* gMutex;

	/** Get the main GObject struct */
	public GMutex* getMutexStruct()
	{
		return gMutex;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gMutex;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GMutex* gMutex)
	{
		this.gMutex = gMutex;
	}


	/**
	 * Frees the resources allocated to a mutex with g_mutex_init().
	 *
	 * This function should not be used with a #GMutex that has been
	 * statically allocated.
	 *
	 * Calling g_mutex_clear() on a locked mutex leads to undefined
	 * behaviour.
	 *
	 * Sine: 2.32
	 */
	public void clear()
	{
		g_mutex_clear(gMutex);
	}

	/**
	 * Initializes a #GMutex so that it can be used.
	 *
	 * This function is useful to initialize a mutex that has been
	 * allocated on the stack, or as part of a larger structure.
	 * It is not necessary to initialize a mutex that has been
	 * statically allocated.
	 *
	 * |[<!-- language="C" -->
	 * typedef struct {
	 * GMutex m;
	 * ...
	 * } Blob;
	 *
	 * Blob *b;
	 *
	 * b = g_new (Blob, 1);
	 * g_mutex_init (&b->m);
	 * ]|
	 *
	 * To undo the effect of g_mutex_init() when a mutex is no longer
	 * needed, use g_mutex_clear().
	 *
	 * Calling g_mutex_init() on an already initialized #GMutex leads
	 * to undefined behaviour.
	 *
	 * Since: 2.32
	 */
	public void init()
	{
		g_mutex_init(gMutex);
	}

	/**
	 * Locks @mutex. If @mutex is already locked by another thread, the
	 * current thread will block until @mutex is unlocked by the other
	 * thread.
	 *
	 * #GMutex is neither guaranteed to be recursive nor to be
	 * non-recursive.  As such, calling g_mutex_lock() on a #GMutex that has
	 * already been locked by the same thread results in undefined behaviour
	 * (including but not limited to deadlocks).
	 */
	public void lock()
	{
		g_mutex_lock(gMutex);
	}

	/**
	 * Tries to lock @mutex. If @mutex is already locked by another thread,
	 * it immediately returns %FALSE. Otherwise it locks @mutex and returns
	 * %TRUE.
	 *
	 * #GMutex is neither guaranteed to be recursive nor to be
	 * non-recursive.  As such, calling g_mutex_lock() on a #GMutex that has
	 * already been locked by the same thread results in undefined behaviour
	 * (including but not limited to deadlocks or arbitrary return values).
	 *
	 * Return: %TRUE if @mutex could be locked
	 */
	public bool trylock()
	{
		return g_mutex_trylock(gMutex) != 0;
	}

	/**
	 * Unlocks @mutex. If another thread is blocked in a g_mutex_lock()
	 * call for @mutex, it will become unblocked and can lock @mutex itself.
	 *
	 * Calling g_mutex_unlock() on a mutex that is not locked by the
	 * current thread leads to undefined behaviour.
	 */
	public void unlock()
	{
		g_mutex_unlock(gMutex);
	}
}
