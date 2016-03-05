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


module glib.Timeout;

private import gi.glib;
public  import gi.glibtypes;
private import glib.Source;


/** */
public class Timeout
{
	/** Holds all timeout delegates */
	bool delegate()[] timeoutListeners;
	/** our gtk timeout ID */
	uint timeoutID;
	
	
	/**
	 * Creates a new timeout cycle with the default priority, GPriority.DEFAULT.
	 *
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next timeout is
	 * recalculated based on the current time and the given interval
	 * (it does not try to 'catch up' time lost in delays).
	 * Params:
	 *    	interval = 	the timeout in milieconds
	 *    	delegate() = 	the delegate to be executed
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(uint interval, bool delegate() dlg, bool fireNow=false)
	{
		timeoutListeners ~= dlg;
		timeoutID = g_timeout_add(interval, cast(GSourceFunc)&timeoutCallback, cast(void*)this);
		if ( fireNow )
		{
			if ( !dlg() )
			{
				timeoutListeners.length = 0;
			}
		}
	}
	
	/**
	 * Creates a new timeout cycle.
	 * Params:
	 *    	interval = 	the timeout in milieconds
	 *    	delegate() = 	the delegate to be executed
	 *      priority = Priority for the timeout function
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(uint interval, bool delegate() dlg, GPriority priority, bool fireNow=false)
	{
		timeoutListeners ~= dlg;
		timeoutID = g_timeout_add_full(priority, interval, cast(GSourceFunc)&timeoutCallback, cast(void*)this, null);
		if ( fireNow )
		{
			if ( !dlg() )
			{
				timeoutListeners.length = 0;
			}
		}
	}
	
	/**
	 * Creates a new timeout cycle with the default priority, GPriority.DEFAULT.
	 * Params:
	 *    	delegate() = 	the delegate to be executed
	 *      seconds = interval in seconds.
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(bool delegate() dlg, uint seconds, bool fireNow=false)
	{
		timeoutListeners ~= dlg;
		timeoutID = g_timeout_add_seconds(seconds, cast(GSourceFunc)&timeoutCallback, cast(void*)this);
		if ( fireNow )
		{
			if ( !dlg() )
			{
				timeoutListeners.length = 0;
			}
		}
	}
	
	/**
	 * Creates a new timeout cycle.
	 * Params:
	 *    	delegate() = 	the delegate to be executed
	 *      seconds = interval in seconds.
	 *      priority = Priority for the timeout function
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(bool delegate() dlg, uint seconds, GPriority priority, bool fireNow=false)
	{
		timeoutListeners ~= dlg;
		timeoutID = g_timeout_add_seconds_full(priority, seconds, cast(GSourceFunc)&timeoutCallback, cast(void*)this, null);
		if ( fireNow )
		{
			if ( !dlg() )
			{
				timeoutListeners.length = 0;
			}
		}
	}
	
	/** */
	public void stop()
	{
		if ( timeoutID > 0 )
		{
			g_source_remove(timeoutID);
		}
		timeoutID = 0;
		timeoutListeners.length = 0;
	}
	
	/**
	 * Removes the timeout from gtk
	 */
	~this()
	{
		stop();
	}
	
	/**
	 * Adds a new delegate to this timeout cycle
	 * Params:
	 *    	dlg =
	 *    	fireNow =
	 */
	public void addListener(bool delegate() dlg, bool fireNow=false)
	{
		timeoutListeners ~= dlg;
		if ( fireNow )
		{
			if ( !dlg() )
			{
				timeoutListeners.length = timeoutListeners.length - 1;
			}
		}
	}
	
	/**
	 * The callback execution from glib
	 * Params:
	 *    	timeout =
	 * Returns:
	 */
	extern(C) static bool timeoutCallback(Timeout timeout)
	{
		return timeout.callAllListeners();
	}
	
	/**
	 * Executes all delegates on the execution list
	 * Returns:
	 */
	private bool callAllListeners()
	{
		bool runAgain = false;
		
		int i = 0;
		
		while ( i<timeoutListeners.length )
		{
			if ( !timeoutListeners[i]() )
			{
				timeoutListeners = timeoutListeners[0..i] ~ timeoutListeners[i+1..timeoutListeners.length];
			}
			else
			{
				runAgain = true;
				++i;
			}
		}
		return runAgain;
	}

	/**
	 */

	/**
	 * Sets a function to be called at regular intervals, with the default
	 * priority, #G_PRIORITY_DEFAULT.  The function is called repeatedly
	 * until it returns %FALSE, at which point the timeout is automatically
	 * destroyed and the function will not be called again.  The first call
	 * to the function will be at the end of the first @interval.
	 *
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next
	 * timeout is recalculated based on the current time and the given interval
	 * (it does not try to 'catch up' time lost in delays).
	 *
	 * See [memory management of sources][mainloop-memory-management] for details
	 * on how to handle the return value and memory management of @data.
	 *
	 * If you want to have a timer in the "seconds" range and do not care
	 * about the exact time of the first call of the timer, use the
	 * g_timeout_add_seconds() function; this function allows for more
	 * optimizations and more efficient system power usage.
	 *
	 * This internally creates a main loop source using g_timeout_source_new()
	 * and attaches it to the global #GMainContext using g_source_attach(), so
	 * the callback will be invoked in whichever thread is running that main
	 * context. You can do these steps manually if you need greater control or to
	 * use a custom main context.
	 *
	 * The interval given is in terms of monotonic time, not wall clock
	 * time.  See g_get_monotonic_time().
	 *
	 * Params:
	 *     interval = the time between calls to the function, in milliseconds
	 *         (1/1000ths of a second)
	 *     funct = function to call
	 *     data = data to pass to @function
	 *
	 * Return: the ID (greater than 0) of the event source.
	 */
	public static uint add(uint interval, GSourceFunc funct, void* data)
	{
		return g_timeout_add(interval, funct, data);
	}

	/**
	 * Sets a function to be called at regular intervals, with the given
	 * priority.  The function is called repeatedly until it returns
	 * %FALSE, at which point the timeout is automatically destroyed and
	 * the function will not be called again.  The @notify function is
	 * called when the timeout is destroyed.  The first call to the
	 * function will be at the end of the first @interval.
	 *
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next
	 * timeout is recalculated based on the current time and the given interval
	 * (it does not try to 'catch up' time lost in delays).
	 *
	 * See [memory management of sources][mainloop-memory-management] for details
	 * on how to handle the return value and memory management of @data.
	 *
	 * This internally creates a main loop source using g_timeout_source_new()
	 * and attaches it to the global #GMainContext using g_source_attach(), so
	 * the callback will be invoked in whichever thread is running that main
	 * context. You can do these steps manually if you need greater control or to
	 * use a custom main context.
	 *
	 * The interval given in terms of monotonic time, not wall clock time.
	 * See g_get_monotonic_time().
	 *
	 * Params:
	 *     priority = the priority of the timeout source. Typically this will be in
	 *         the range between #G_PRIORITY_DEFAULT and #G_PRIORITY_HIGH.
	 *     interval = the time between calls to the function, in milliseconds
	 *         (1/1000ths of a second)
	 *     funct = function to call
	 *     data = data to pass to @function
	 *     notify = function to call when the timeout is removed, or %NULL
	 *
	 * Return: the ID (greater than 0) of the event source.
	 */
	public static uint addFull(int priority, uint interval, GSourceFunc funct, void* data, GDestroyNotify notify)
	{
		return g_timeout_add_full(priority, interval, funct, data, notify);
	}

	/**
	 * Sets a function to be called at regular intervals with the default
	 * priority, #G_PRIORITY_DEFAULT. The function is called repeatedly until
	 * it returns %FALSE, at which point the timeout is automatically destroyed
	 * and the function will not be called again.
	 *
	 * This internally creates a main loop source using
	 * g_timeout_source_new_seconds() and attaches it to the main loop context
	 * using g_source_attach(). You can do these steps manually if you need
	 * greater control. Also see g_timeout_add_seconds_full().
	 *
	 * Note that the first call of the timer may not be precise for timeouts
	 * of one second. If you need finer precision and have such a timeout,
	 * you may want to use g_timeout_add() instead.
	 *
	 * See [memory management of sources][mainloop-memory-management] for details
	 * on how to handle the return value and memory management of @data.
	 *
	 * The interval given is in terms of monotonic time, not wall clock
	 * time.  See g_get_monotonic_time().
	 *
	 * Params:
	 *     interval = the time between calls to the function, in seconds
	 *     funct = function to call
	 *     data = data to pass to @function
	 *
	 * Return: the ID (greater than 0) of the event source.
	 *
	 * Since: 2.14
	 */
	public static uint addSeconds(uint interval, GSourceFunc funct, void* data)
	{
		return g_timeout_add_seconds(interval, funct, data);
	}

	/**
	 * Sets a function to be called at regular intervals, with @priority.
	 * The function is called repeatedly until it returns %FALSE, at which
	 * point the timeout is automatically destroyed and the function will
	 * not be called again.
	 *
	 * Unlike g_timeout_add(), this function operates at whole second granularity.
	 * The initial starting point of the timer is determined by the implementation
	 * and the implementation is expected to group multiple timers together so that
	 * they fire all at the same time.
	 * To allow this grouping, the @interval to the first timer is rounded
	 * and can deviate up to one second from the specified interval.
	 * Subsequent timer iterations will generally run at the specified interval.
	 *
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next
	 * timeout is recalculated based on the current time and the given @interval
	 *
	 * See [memory management of sources][mainloop-memory-management] for details
	 * on how to handle the return value and memory management of @data.
	 *
	 * If you want timing more precise than whole seconds, use g_timeout_add()
	 * instead.
	 *
	 * The grouping of timers to fire at the same time results in a more power
	 * and CPU efficient behavior so if your timer is in multiples of seconds
	 * and you don't require the first timer exactly one second from now, the
	 * use of g_timeout_add_seconds() is preferred over g_timeout_add().
	 *
	 * This internally creates a main loop source using
	 * g_timeout_source_new_seconds() and attaches it to the main loop context
	 * using g_source_attach(). You can do these steps manually if you need
	 * greater control.
	 *
	 * The interval given is in terms of monotonic time, not wall clock
	 * time.  See g_get_monotonic_time().
	 *
	 * Params:
	 *     priority = the priority of the timeout source. Typically this will be in
	 *         the range between #G_PRIORITY_DEFAULT and #G_PRIORITY_HIGH.
	 *     interval = the time between calls to the function, in seconds
	 *     funct = function to call
	 *     data = data to pass to @function
	 *     notify = function to call when the timeout is removed, or %NULL
	 *
	 * Return: the ID (greater than 0) of the event source.
	 *
	 * Since: 2.14
	 */
	public static uint addSecondsFull(int priority, uint interval, GSourceFunc funct, void* data, GDestroyNotify notify)
	{
		return g_timeout_add_seconds_full(priority, interval, funct, data, notify);
	}

	/**
	 * Creates a new timeout source.
	 *
	 * The source will not initially be associated with any #GMainContext
	 * and must be added to one with g_source_attach() before it will be
	 * executed.
	 *
	 * The interval given is in terms of monotonic time, not wall clock
	 * time.  See g_get_monotonic_time().
	 *
	 * Params:
	 *     interval = the timeout interval in milliseconds.
	 *
	 * Return: the newly-created timeout source
	 */
	public static Source sourceNew(uint interval)
	{
		auto p = g_timeout_source_new(interval);
		
		if(p is null)
		{
			return null;
		}
		
		return new Source(cast(GSource*) p);
	}

	/**
	 * Creates a new timeout source.
	 *
	 * The source will not initially be associated with any #GMainContext
	 * and must be added to one with g_source_attach() before it will be
	 * executed.
	 *
	 * The scheduling granularity/accuracy of this timeout source will be
	 * in seconds.
	 *
	 * The interval given in terms of monotonic time, not wall clock time.
	 * See g_get_monotonic_time().
	 *
	 * Params:
	 *     interval = the timeout interval in seconds
	 *
	 * Return: the newly-created timeout source
	 *
	 * Since: 2.14
	 */
	public static Source sourceNewSeconds(uint interval)
	{
		auto p = g_timeout_source_new_seconds(interval);
		
		if(p is null)
		{
			return null;
		}
		
		return new Source(cast(GSource*) p);
	}
}
