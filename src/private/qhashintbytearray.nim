proc setup*(self: var QHashIntByteArray) =
  ## Setup the QHash
  dos_qhash_int_qbytearray_create(self.vptr)

proc delete*(self: QHashIntByteArray) =
  ## Delete the QHash
  if self.vptr.isNil:
    return
  debugMsg("QHashIntByteArray", "delete")
  dos_qhash_int_qbytearray_delete(self.vptr)
  self.vptr.resetToNil

proc newQHashIntQByteArray*(): QHashIntByteArray =
  ## Create a new QHashIntQByteArray
  new(result, delete)
  result.setup()

proc insert*(self: QHashIntByteArray, key: int, value: cstring) =
  ## Insert the value at the given key
  dos_qhash_int_qbytearray_insert(self.vptr, key, value)

proc value*(self: QHashIntByteArray, key: int): string =
  ## Return the value associated at the given key
  var rawString: cstring
  dos_qhash_int_qbytearray_value(self.vptr, key, rawString)
  result = $rawString
  dos_chararray_delete(rawString)
