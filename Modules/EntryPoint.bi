#ifndef ENTRYPOINT_BI
#define ENTRYPOINT_BI

#ifdef WITHOUT_RUNTIME

Declare Function EntryPoint Alias "EntryPoint"()As Integer

#else

' Точка входа — в библиотеках времени выполнения

#endif


#endif
