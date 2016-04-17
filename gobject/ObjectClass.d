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


module gobject.ObjectClass;

private import gi.gobject;
public  import gi.gobjecttypes;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.ParamSpec;


/**
 * The class structure for the GObject type.
 * 
 * <example>
 * <title>Implementing singletons using a constructor</title>
 * <programlisting>
 * static MySingleton *the_singleton = NULL;
 * 
 * static GObject*
 * my_singleton_constructor (GType                  type,
 * guint                  n_construct_params,
 * GObjectConstructParam *construct_params)
 * {
 * GObject *object;
 * 
 * if (!the_singleton)
 * {
 * object = G_OBJECT_CLASS (parent_class)->constructor (type,
 * n_construct_params,
 * construct_params);
 * the_singleton = MY_SINGLETON (object);
 * }
 * else
 * object = g_object_ref (G_OBJECT (the_singleton));
 * 
 * return object;
 * }
 * </programlisting></example>
 */
public class ObjectClass
{
	/** the main GObject struct */
	protected GObjectClass* gObjectClass;

	/** Get the main GObject struct */
	public GObjectClass* getObjectClassStruct()
	{
		return gObjectClass;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gObjectClass;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GObjectClass* gObjectClass)
	{
		this.gObjectClass = gObjectClass;
	}


	/**
	 * Looks up the #GParamSpec for a property of a class.
	 *
	 * Params:
	 *     propertyName = the name of the property to look up
	 *
	 * Return: the #GParamSpec for the property, or
	 *     %NULL if the class doesn't have a property of that name
	 */
	public ParamSpec findProperty(string propertyName)
	{
		auto p = g_object_class_find_property(gObjectClass, Str.toStringz(propertyName));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(ParamSpec)(cast(GParamSpec*) p);
	}

	/**
	 * Installs new properties from an array of #GParamSpecs.
	 *
	 * All properties should be installed during the class initializer.  It
	 * is possible to install properties after that, but doing so is not
	 * recommend, and specifically, is not guaranteed to be thread-safe vs.
	 * use of properties on the same type on other threads.
	 *
	 * The property id of each property is the index of each #GParamSpec in
	 * the @pspecs array.
	 *
	 * The property id of 0 is treated specially by #GObject and it should not
	 * be used to store a #GParamSpec.
	 *
	 * This function should be used if you plan to use a static array of
	 * #GParamSpecs and g_object_notify_by_pspec(). For instance, this
	 * class initialization:
	 *
	 * |[<!-- language="C" -->
	 * enum {
	 * PROP_0, PROP_FOO, PROP_BAR, N_PROPERTIES
	 * };
	 *
	 * static GParamSpec *obj_properties[N_PROPERTIES] = { NULL, };
	 *
	 * static void
	 * my_object_class_init (MyObjectClass *klass)
	 * {
	 * GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
	 *
	 * obj_properties[PROP_FOO] =
	 * g_param_spec_int ("foo", "Foo", "Foo",
	 * -1, G_MAXINT,
	 * 0,
	 * G_PARAM_READWRITE);
	 *
	 * obj_properties[PROP_BAR] =
	 * g_param_spec_string ("bar", "Bar", "Bar",
	 * NULL,
	 * G_PARAM_READWRITE);
	 *
	 * gobject_class->set_property = my_object_set_property;
	 * gobject_class->get_property = my_object_get_property;
	 * g_object_class_install_properties (gobject_class,
	 * N_PROPERTIES,
	 * obj_properties);
	 * }
	 * ]|
	 *
	 * allows calling g_object_notify_by_pspec() to notify of property changes:
	 *
	 * |[<!-- language="C" -->
	 * void
	 * my_object_set_foo (MyObject *self, gint foo)
	 * {
	 * if (self->foo != foo)
	 * {
	 * self->foo = foo;
	 * g_object_notify_by_pspec (G_OBJECT (self), obj_properties[PROP_FOO]);
	 * }
	 * }
	 * ]|
	 *
	 * Params:
	 *     nPspecs = the length of the #GParamSpecs array
	 *     pspecs = the #GParamSpecs array
	 *         defining the new properties
	 *
	 * Since: 2.26
	 */
	public void installProperties(ParamSpec[] pspecs)
	{
		GParamSpec*[] pspecsArray = new GParamSpec*[pspecs.length];
		for ( int i = 0; i < pspecs.length; i++ )
		{
			pspecsArray[i] = pspecs[i].getParamSpecStruct();
		}
		
		g_object_class_install_properties(gObjectClass, cast(uint)pspecs.length, pspecsArray.ptr);
	}

	/**
	 * Installs a new property.
	 *
	 * All properties should be installed during the class initializer.  It
	 * is possible to install properties after that, but doing so is not
	 * recommend, and specifically, is not guaranteed to be thread-safe vs.
	 * use of properties on the same type on other threads.
	 *
	 * Note that it is possible to redefine a property in a derived class,
	 * by installing a property with the same name. This can be useful at times,
	 * e.g. to change the range of allowed values or the default value.
	 *
	 * Params:
	 *     propertyId = the id for the new property
	 *     pspec = the #GParamSpec for the new property
	 */
	public void installProperty(uint propertyId, ParamSpec pspec)
	{
		g_object_class_install_property(gObjectClass, propertyId, (pspec is null) ? null : pspec.getParamSpecStruct());
	}

	/**
	 * Get an array of #GParamSpec* for all properties of a class.
	 *
	 * Return: an array of
	 *     #GParamSpec* which should be freed after use
	 */
	public ParamSpec[] listProperties()
	{
		uint nProperties;
		
		auto p = g_object_class_list_properties(gObjectClass, &nProperties);
		
		if(p is null)
		{
			return null;
		}
		
		ParamSpec[] arr = new ParamSpec[nProperties];
		for(int i = 0; i < nProperties; i++)
		{
			arr[i] = ObjectG.getDObject!(ParamSpec)(cast(GParamSpec*) p[i]);
		}
		
		return arr;
	}

	/**
	 * Registers @property_id as referring to a property with the name
	 * @name in a parent class or in an interface implemented by @oclass.
	 * This allows this class to "override" a property implementation in
	 * a parent class or to provide the implementation of a property from
	 * an interface.
	 *
	 * Internally, overriding is implemented by creating a property of type
	 * #GParamSpecOverride; generally operations that query the properties of
	 * the object class, such as g_object_class_find_property() or
	 * g_object_class_list_properties() will return the overridden
	 * property. However, in one case, the @construct_properties argument of
	 * the @constructor virtual function, the #GParamSpecOverride is passed
	 * instead, so that the @param_id field of the #GParamSpec will be
	 * correct.  For virtually all uses, this makes no difference. If you
	 * need to get the overridden property, you can call
	 * g_param_spec_get_redirect_target().
	 *
	 * Params:
	 *     propertyId = the new property ID
	 *     name = the name of a property registered in a parent class or
	 *         in an interface of this class.
	 *
	 * Since: 2.4
	 */
	public void overrideProperty(uint propertyId, string name)
	{
		g_object_class_override_property(gObjectClass, propertyId, Str.toStringz(name));
	}
}
