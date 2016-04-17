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


module glib.TestSuite;

private import gi.glib;
public  import gi.glibtypes;


/**
 * An opaque structure representing a test suite.
 */
public class TestSuite
{
	/** the main GObject struct */
	protected GTestSuite* gTestSuite;

	/** Get the main GObject struct */
	public GTestSuite* getTestSuiteStruct()
	{
		return gTestSuite;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTestSuite;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTestSuite* gTestSuite)
	{
		this.gTestSuite = gTestSuite;
	}


	/**
	 * Adds @test_case to @suite.
	 *
	 * Params:
	 *     testCase = a #GTestCase
	 *
	 * Since: 2.16
	 */
	public void add(GTestCase* testCase)
	{
		g_test_suite_add(gTestSuite, testCase);
	}

	/**
	 * Adds @nestedsuite to @suite.
	 *
	 * Params:
	 *     nestedsuite = another #GTestSuite
	 *
	 * Since: 2.16
	 */
	public void addSuite(TestSuite nestedsuite)
	{
		g_test_suite_add_suite(gTestSuite, (nestedsuite is null) ? null : nestedsuite.getTestSuiteStruct());
	}
}
