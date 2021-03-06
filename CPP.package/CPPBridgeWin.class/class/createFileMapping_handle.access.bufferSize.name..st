memory operations
createFileMapping_handle: aHandle access: flag bufferSize: buff_size name: aName
	"this is responsible for mapping the memory to be shared"

	| return |
	"CreateFileMapping(
		INVALID_HANDLE_VALUE,    // use paging file
		NULL,                    // default security
		PAGE_READWRITE,          // read/write access
		0,                       // maximum object size (high-order DWORD)
		BUF_SIZE,                // maximum object size (low-order DWORD)
		szName);                 // name of mapping object"
	return := self
		ffiCall: #(void * CreateFileMappingW #(void * aHandle , 0 , unsignedLong flag , 0 , unsignedLong buff_size , String aName)).
	return value = 0
		ifTrue: [ self error: 'Error mapping file to memory' ].
	^ return