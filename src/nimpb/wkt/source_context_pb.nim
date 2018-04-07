# Generated by protoc_gen_nim. Do not edit!

import intsets

import nimpb/nimpb

type
    google_protobuf_SourceContext* = ref google_protobuf_SourceContextObj
    google_protobuf_SourceContextObj* = object of RootObj
        hasField: IntSet
        unknownFields: seq[UnknownField]
        file_name: string

proc newgoogle_protobuf_SourceContext*(): google_protobuf_SourceContext
proc newgoogle_protobuf_SourceContext*(data: string): google_protobuf_SourceContext
proc writegoogle_protobuf_SourceContext*(stream: ProtobufStream, message: google_protobuf_SourceContext)
proc readgoogle_protobuf_SourceContext*(stream: ProtobufStream): google_protobuf_SourceContext
proc sizeOfgoogle_protobuf_SourceContext*(message: google_protobuf_SourceContext): uint64

proc newgoogle_protobuf_SourceContext*(): google_protobuf_SourceContext =
    new(result)
    result.hasField = initIntSet()
    result.unknownFields = @[]
    result.file_name = ""

proc clearfile_name*(message: google_protobuf_SourceContext) =
    message.file_name = ""
    excl(message.hasField, [1])

proc hasfile_name*(message: google_protobuf_SourceContext): bool =
    result = contains(message.hasField, 1)

proc setfile_name*(message: google_protobuf_SourceContext, value: string) =
    message.file_name = value
    incl(message.hasField, 1)

proc file_name*(message: google_protobuf_SourceContext): string {.inline.} =
    message.file_name

proc `file_name=`*(message: google_protobuf_SourceContext, value: string) {.inline.} =
    setfile_name(message, value)

proc sizeOfgoogle_protobuf_SourceContext*(message: google_protobuf_SourceContext): uint64 =
    if hasfile_name(message):
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfString(message.file_name)
    for field in message.unknownFields:
        result = result + sizeOfUnknownField(field)

proc writegoogle_protobuf_SourceContext*(stream: ProtobufStream, message: google_protobuf_SourceContext) =
    if hasfile_name(message):
        writeString(stream, message.file_name, 1)
    writeUnknownFields(stream, message.unknownFields)

proc readgoogle_protobuf_SourceContext*(stream: ProtobufStream): google_protobuf_SourceContext =
    result = newgoogle_protobuf_SourceContext()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            setfile_name(result, readString(stream))
        else: readUnknownField(stream, tag, result.unknownFields)

proc serialize*(message: google_protobuf_SourceContext): string =
    let
        ss = newStringStream()
        pbs = newProtobufStream(ss)
    writegoogle_protobuf_SourceContext(pbs, message)
    result = ss.data

proc newgoogle_protobuf_SourceContext*(data: string): google_protobuf_SourceContext =
    let
        ss = newStringStream(data)
        pbs = newProtobufStream(ss)
    result = readgoogle_protobuf_SourceContext(pbs)


