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


module glib.TestLogBuffer;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ConstructionException;
private import glib.TestLogMsg;


/** */
public class TestLogBuffer
{
	/** the main GObject struct */
	protected GTestLogBuffer* gTestLogBuffer;

	/** Get the main GObject struct */
	public GTestLogBuffer* getTestLogBufferStruct()
	{
		return gTestLogBuffer;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTestLogBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTestLogBuffer* gTestLogBuffer)
	{
		this.gTestLogBuffer = gTestLogBuffer;
	}


	/**
	 * Internal function for gtester to free test log messages, no ABI guarantees provided.
	 */
	public void free()
	{
		g_test_log_buffer_free(gTestLogBuffer);
	}

	/**
	 * Internal function for gtester to retrieve test log messages, no ABI guarantees provided.
	 */
	public TestLogMsg pop()
	{
		auto p = g_test_log_buffer_pop(gTestLogBuffer);
		
		if(p is null)
		{
			return null;
		}
		
		return new TestLogMsg(cast(GTestLogMsg*) p);
	}

	/**
	 * Internal function for gtester to decode test log messages, no ABI guarantees provided.
	 */
	public void push(uint nBytes, ubyte* bytes)
	{
		g_test_log_buffer_push(gTestLogBuffer, nBytes, bytes);
	}

	/**
	 * Internal function for gtester to decode test log messages, no ABI guarantees provided.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = g_test_log_buffer_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GTestLogBuffer*) p);
	}
}
