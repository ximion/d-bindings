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


module gio.DBusMessage;

private import gi.gio;
public  import gi.giotypes;
private import gio.UnixFDList;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;


/**
 * A type for representing D-Bus messages that can be sent or received
 * on a #GDBusConnection.
 *
 * Since: 2.26
 */
public class DBusMessage : ObjectG
{
	/** the main GObject struct */
	protected GDBusMessage* gDBusMessage;

	/** Get the main GObject struct */
	public GDBusMessage* getDBusMessageStruct()
	{
		return gDBusMessage;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gDBusMessage;
	}

	protected override void setStruct(GObject* obj)
	{
		gDBusMessage = cast(GDBusMessage*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GDBusMessage* gDBusMessage, bool ownedRef = false)
	{
		this.gDBusMessage = gDBusMessage;
		super(cast(GObject*)gDBusMessage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_dbus_message_get_type();
	}

	/**
	 * Creates a new empty #GDBusMessage.
	 *
	 * Return: A #GDBusMessage. Free with g_object_unref().
	 *
	 * Since: 2.26
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = g_dbus_message_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GDBusMessage*) p, true);
	}

	/**
	 * Creates a new #GDBusMessage from the data stored at @blob. The byte
	 * order that the message was in can be retrieved using
	 * g_dbus_message_get_byte_order().
	 *
	 * Params:
	 *     blob = A blob represent a binary D-Bus message.
	 *     blobLen = The length of @blob.
	 *     capabilities = A #GDBusCapabilityFlags describing what protocol features are supported.
	 *
	 * Return: A new #GDBusMessage or %NULL if @error is set. Free with
	 *     g_object_unref().
	 *
	 * Since: 2.26
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(char[] blob, GDBusCapabilityFlags capabilities)
	{
		GError* err = null;
		
		auto p = g_dbus_message_new_from_blob(blob.ptr, cast(size_t)blob.length, capabilities, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_blob");
		}
		
		this(cast(GDBusMessage*) p, true);
	}

	/**
	 * Creates a new #GDBusMessage for a method call.
	 *
	 * Params:
	 *     name = A valid D-Bus name or %NULL.
	 *     path = A valid object path.
	 *     iface = A valid D-Bus interface name or %NULL.
	 *     method = A valid method name.
	 *
	 * Return: A #GDBusMessage. Free with g_object_unref().
	 *
	 * Since: 2.26
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string name, string path, string iface, string method)
	{
		auto p = g_dbus_message_new_method_call(Str.toStringz(name), Str.toStringz(path), Str.toStringz(iface), Str.toStringz(method));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_method_call");
		}
		
		this(cast(GDBusMessage*) p, true);
	}

	/**
	 * Creates a new #GDBusMessage for a signal emission.
	 *
	 * Params:
	 *     path = A valid object path.
	 *     iface = A valid D-Bus interface name.
	 *     signal = A valid signal name.
	 *
	 * Return: A #GDBusMessage. Free with g_object_unref().
	 *
	 * Since: 2.26
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string path, string iface, string signal)
	{
		auto p = g_dbus_message_new_signal(Str.toStringz(path), Str.toStringz(iface), Str.toStringz(signal));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_signal");
		}
		
		this(cast(GDBusMessage*) p, true);
	}

	/**
	 * Utility function to calculate how many bytes are needed to
	 * completely deserialize the D-Bus message stored at @blob.
	 *
	 * Params:
	 *     blob = A blob represent a binary D-Bus message.
	 *     blobLen = The length of @blob (must be at least 16).
	 *
	 * Return: Number of bytes needed or -1 if @error is set (e.g. if
	 *     @blob contains invalid data or not enough data is available to
	 *     determine the size).
	 *
	 * Since: 2.26
	 *
	 * Throws: GException on failure.
	 */
	public static ptrdiff_t bytesNeeded(char[] blob)
	{
		GError* err = null;
		
		auto p = g_dbus_message_bytes_needed(blob.ptr, cast(size_t)blob.length, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Copies @message. The copy is a deep copy and the returned
	 * #GDBusMessage is completely identical except that it is guaranteed
	 * to not be locked.
	 *
	 * This operation can fail if e.g. @message contains file descriptors
	 * and the per-process or system-wide open files limit is reached.
	 *
	 * Return: A new #GDBusMessage or %NULL if @error is set.
	 *     Free with g_object_unref().
	 *
	 * Since: 2.26
	 *
	 * Throws: GException on failure.
	 */
	public DBusMessage copy()
	{
		GError* err = null;
		
		auto p = g_dbus_message_copy(gDBusMessage, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusMessage)(cast(GDBusMessage*) p, true);
	}

	/**
	 * Convenience to get the first item in the body of @message.
	 *
	 * Return: The string item or %NULL if the first item in the body of
	 *     @message is not a string.
	 *
	 * Since: 2.26
	 */
	public string getArg0()
	{
		return Str.toString(g_dbus_message_get_arg0(gDBusMessage));
	}

	/**
	 * Gets the body of a message.
	 *
	 * Return: A #GVariant or %NULL if the body is
	 *     empty. Do not free, it is owned by @message.
	 *
	 * Since: 2.26
	 */
	public Variant getBody()
	{
		auto p = g_dbus_message_get_body(gDBusMessage);
		
		if(p is null)
		{
			return null;
		}
		
		return new Variant(cast(GVariant*) p);
	}

	/**
	 * Gets the byte order of @message.
	 *
	 * Return: The byte order.
	 */
	public GDBusMessageByteOrder getByteOrder()
	{
		return g_dbus_message_get_byte_order(gDBusMessage);
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public string getDestination()
	{
		return Str.toString(g_dbus_message_get_destination(gDBusMessage));
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public string getErrorName()
	{
		return Str.toString(g_dbus_message_get_error_name(gDBusMessage));
	}

	/**
	 * Gets the flags for @message.
	 *
	 * Return: Flags that are set (typically values from the #GDBusMessageFlags enumeration bitwise ORed together).
	 *
	 * Since: 2.26
	 */
	public GDBusMessageFlags getFlags()
	{
		return g_dbus_message_get_flags(gDBusMessage);
	}

	/**
	 * Gets a header field on @message.
	 *
	 * Params:
	 *     headerField = A 8-bit unsigned integer (typically a value from the #GDBusMessageHeaderField enumeration)
	 *
	 * Return: A #GVariant with the value if the header was found, %NULL
	 *     otherwise. Do not free, it is owned by @message.
	 *
	 * Since: 2.26
	 */
	public Variant getHeader(GDBusMessageHeaderField headerField)
	{
		auto p = g_dbus_message_get_header(gDBusMessage, headerField);
		
		if(p is null)
		{
			return null;
		}
		
		return new Variant(cast(GVariant*) p);
	}

	/**
	 * Gets an array of all header fields on @message that are set.
	 *
	 * Return: An array of header fields
	 *     terminated by %G_DBUS_MESSAGE_HEADER_FIELD_INVALID.  Each element
	 *     is a #guchar. Free with g_free().
	 *
	 * Since: 2.26
	 */
	public char[] getHeaderFields()
	{
		auto p = g_dbus_message_get_header_fields(gDBusMessage);
		
		return p[0 .. getArrayLength(p)];
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public string getInterface()
	{
		return Str.toString(g_dbus_message_get_interface(gDBusMessage));
	}

	/**
	 * Checks whether @message is locked. To monitor changes to this
	 * value, conncet to the #GObject::notify signal to listen for changes
	 * on the #GDBusMessage:locked property.
	 *
	 * Return: %TRUE if @message is locked, %FALSE otherwise.
	 *
	 * Since: 2.26
	 */
	public bool getLocked()
	{
		return g_dbus_message_get_locked(gDBusMessage) != 0;
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public string getMember()
	{
		return Str.toString(g_dbus_message_get_member(gDBusMessage));
	}

	/**
	 * Gets the type of @message.
	 *
	 * Return: A 8-bit unsigned integer (typically a value from the #GDBusMessageType enumeration).
	 *
	 * Since: 2.26
	 */
	public GDBusMessageType getMessageType()
	{
		return g_dbus_message_get_message_type(gDBusMessage);
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public uint getNumUnixFds()
	{
		return g_dbus_message_get_num_unix_fds(gDBusMessage);
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public string getPath()
	{
		return Str.toString(g_dbus_message_get_path(gDBusMessage));
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public uint getReplySerial()
	{
		return g_dbus_message_get_reply_serial(gDBusMessage);
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public string getSender()
	{
		return Str.toString(g_dbus_message_get_sender(gDBusMessage));
	}

	/**
	 * Gets the serial for @message.
	 *
	 * Return: A #guint32.
	 *
	 * Since: 2.26
	 */
	public uint getSerial()
	{
		return g_dbus_message_get_serial(gDBusMessage);
	}

	/**
	 * Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field.
	 *
	 * Return: The value.
	 *
	 * Since: 2.26
	 */
	public string getSignature()
	{
		return Str.toString(g_dbus_message_get_signature(gDBusMessage));
	}

	/**
	 * Gets the UNIX file descriptors associated with @message, if any.
	 *
	 * This method is only available on UNIX.
	 *
	 * Return: A #GUnixFDList or %NULL if no file descriptors are
	 *     associated. Do not free, this object is owned by @message.
	 *
	 * Since: 2.26
	 */
	public UnixFDList getUnixFdList()
	{
		auto p = g_dbus_message_get_unix_fd_list(gDBusMessage);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(UnixFDList)(cast(GUnixFDList*) p);
	}

	/**
	 * If @message is locked, does nothing. Otherwise locks the message.
	 *
	 * Since: 2.26
	 */
	public void lock()
	{
		g_dbus_message_lock(gDBusMessage);
	}

	/**
	 * Creates a new #GDBusMessage that is an error reply to @method_call_message.
	 *
	 * Params:
	 *     errorName = A valid D-Bus error name.
	 *     errorMessage = The D-Bus error message.
	 *
	 * Return: A #GDBusMessage. Free with g_object_unref().
	 *
	 * Since: 2.26
	 */
	public DBusMessage newMethodErrorLiteral(string errorName, string errorMessage)
	{
		auto p = g_dbus_message_new_method_error_literal(gDBusMessage, Str.toStringz(errorName), Str.toStringz(errorMessage));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusMessage)(cast(GDBusMessage*) p, true);
	}

	/**
	 * Like g_dbus_message_new_method_error() but intended for language bindings.
	 *
	 * Params:
	 *     errorName = A valid D-Bus error name.
	 *     errorMessageFormat = The D-Bus error message in a printf() format.
	 *     varArgs = Arguments for @error_message_format.
	 *
	 * Return: A #GDBusMessage. Free with g_object_unref().
	 *
	 * Since: 2.26
	 */
	public DBusMessage newMethodErrorValist(string errorName, string errorMessageFormat, void* varArgs)
	{
		auto p = g_dbus_message_new_method_error_valist(gDBusMessage, Str.toStringz(errorName), Str.toStringz(errorMessageFormat), varArgs);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusMessage)(cast(GDBusMessage*) p, true);
	}

	/**
	 * Creates a new #GDBusMessage that is a reply to @method_call_message.
	 *
	 * Return: #GDBusMessage. Free with g_object_unref().
	 *
	 * Since: 2.26
	 */
	public DBusMessage newMethodReply()
	{
		auto p = g_dbus_message_new_method_reply(gDBusMessage);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(DBusMessage)(cast(GDBusMessage*) p, true);
	}

	/**
	 * Produces a human-readable multi-line description of @message.
	 *
	 * The contents of the description has no ABI guarantees, the contents
	 * and formatting is subject to change at any time. Typical output
	 * looks something like this:
	 * |[
	 * Flags:   none
	 * Version: 0
	 * Serial:  4
	 * Headers:
	 * path -> objectpath '/org/gtk/GDBus/TestObject'
	 * interface -> 'org.gtk.GDBus.TestInterface'
	 * member -> 'GimmeStdout'
	 * destination -> ':1.146'
	 * Body: ()
	 * UNIX File Descriptors:
	 * (none)
	 * ]|
	 * or
	 * |[
	 * Flags:   no-reply-expected
	 * Version: 0
	 * Serial:  477
	 * Headers:
	 * reply-serial -> uint32 4
	 * destination -> ':1.159'
	 * sender -> ':1.146'
	 * num-unix-fds -> uint32 1
	 * Body: ()
	 * UNIX File Descriptors:
	 * fd 12: dev=0:10,mode=020620,ino=5,uid=500,gid=5,rdev=136:2,size=0,atime=1273085037,mtime=1273085851,ctime=1272982635
	 * ]|
	 *
	 * Params:
	 *     indent = Indentation level.
	 *
	 * Return: A string that should be freed with g_free().
	 *
	 * Since: 2.26
	 */
	public string print(uint indent)
	{
		return Str.toString(g_dbus_message_print(gDBusMessage, indent));
	}

	/**
	 * Sets the body @message. As a side-effect the
	 * %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field is set to the
	 * type string of @body (or cleared if @body is %NULL).
	 *
	 * If @body is floating, @message assumes ownership of @body.
	 *
	 * Params:
	 *     bod = Either %NULL or a #GVariant that is a tuple.
	 *
	 * Since: 2.26
	 */
	public void setBody(Variant bod)
	{
		g_dbus_message_set_body(gDBusMessage, (bod is null) ? null : bod.getVariantStruct());
	}

	/**
	 * Sets the byte order of @message.
	 *
	 * Params:
	 *     byteOrder = The byte order.
	 */
	public void setByteOrder(GDBusMessageByteOrder byteOrder)
	{
		g_dbus_message_set_byte_order(gDBusMessage, byteOrder);
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setDestination(string value)
	{
		g_dbus_message_set_destination(gDBusMessage, Str.toStringz(value));
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setErrorName(string value)
	{
		g_dbus_message_set_error_name(gDBusMessage, Str.toStringz(value));
	}

	/**
	 * Sets the flags to set on @message.
	 *
	 * Params:
	 *     flags = Flags for @message that are set (typically values from the #GDBusMessageFlags
	 *         enumeration bitwise ORed together).
	 *
	 * Since: 2.26
	 */
	public void setFlags(GDBusMessageFlags flags)
	{
		g_dbus_message_set_flags(gDBusMessage, flags);
	}

	/**
	 * Sets a header field on @message.
	 *
	 * If @value is floating, @message assumes ownership of @value.
	 *
	 * Params:
	 *     headerField = A 8-bit unsigned integer (typically a value from the #GDBusMessageHeaderField enumeration)
	 *     value = A #GVariant to set the header field or %NULL to clear the header field.
	 *
	 * Since: 2.26
	 */
	public void setHeader(GDBusMessageHeaderField headerField, Variant value)
	{
		g_dbus_message_set_header(gDBusMessage, headerField, (value is null) ? null : value.getVariantStruct());
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setInterface(string value)
	{
		g_dbus_message_set_interface(gDBusMessage, Str.toStringz(value));
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setMember(string value)
	{
		g_dbus_message_set_member(gDBusMessage, Str.toStringz(value));
	}

	/**
	 * Sets @message to be of @type.
	 *
	 * Params:
	 *     type = A 8-bit unsigned integer (typically a value from the #GDBusMessageType enumeration).
	 *
	 * Since: 2.26
	 */
	public void setMessageType(GDBusMessageType type)
	{
		g_dbus_message_set_message_type(gDBusMessage, type);
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setNumUnixFds(uint value)
	{
		g_dbus_message_set_num_unix_fds(gDBusMessage, value);
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setPath(string value)
	{
		g_dbus_message_set_path(gDBusMessage, Str.toStringz(value));
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setReplySerial(uint value)
	{
		g_dbus_message_set_reply_serial(gDBusMessage, value);
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setSender(string value)
	{
		g_dbus_message_set_sender(gDBusMessage, Str.toStringz(value));
	}

	/**
	 * Sets the serial for @message.
	 *
	 * Params:
	 *     serial = A #guint32.
	 *
	 * Since: 2.26
	 */
	public void setSerial(uint serial)
	{
		g_dbus_message_set_serial(gDBusMessage, serial);
	}

	/**
	 * Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field.
	 *
	 * Params:
	 *     value = The value to set.
	 *
	 * Since: 2.26
	 */
	public void setSignature(string value)
	{
		g_dbus_message_set_signature(gDBusMessage, Str.toStringz(value));
	}

	/**
	 * Sets the UNIX file descriptors associated with @message. As a
	 * side-effect the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header
	 * field is set to the number of fds in @fd_list (or cleared if
	 * @fd_list is %NULL).
	 *
	 * This method is only available on UNIX.
	 *
	 * Params:
	 *     fdList = A #GUnixFDList or %NULL.
	 *
	 * Since: 2.26
	 */
	public void setUnixFdList(UnixFDList fdList)
	{
		g_dbus_message_set_unix_fd_list(gDBusMessage, (fdList is null) ? null : fdList.getUnixFDListStruct());
	}

	/**
	 * Serializes @message to a blob. The byte order returned by
	 * g_dbus_message_get_byte_order() will be used.
	 *
	 * Params:
	 *     capabilities = A #GDBusCapabilityFlags describing what protocol features are supported.
	 *
	 * Return: A pointer to a
	 *     valid binary D-Bus message of @out_size bytes generated by @message
	 *     or %NULL if @error is set. Free with g_free().
	 *
	 * Since: 2.26
	 *
	 * Throws: GException on failure.
	 */
	public char[] toBlob(GDBusCapabilityFlags capabilities)
	{
		size_t outSize;
		GError* err = null;
		
		auto p = g_dbus_message_to_blob(gDBusMessage, &outSize, capabilities, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p[0 .. outSize];
	}

	/**
	 * If @message is not of type %G_DBUS_MESSAGE_TYPE_ERROR does
	 * nothing and returns %FALSE.
	 *
	 * Otherwise this method encodes the error in @message as a #GError
	 * using g_dbus_error_set_dbus_error() using the information in the
	 * %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field of @message as
	 * well as the first string item in @message's body.
	 *
	 * Return: %TRUE if @error was set, %FALSE otherwise.
	 *
	 * Since: 2.26
	 *
	 * Throws: GException on failure.
	 */
	public bool toGerror()
	{
		GError* err = null;
		
		auto p = g_dbus_message_to_gerror(gDBusMessage, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}
}
