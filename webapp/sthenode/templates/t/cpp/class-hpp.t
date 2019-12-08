%########################################################################
%# Copyright (c) 1988-2018 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: class-hpp.t
%#
%# Author: $author$
%#   Date: 4/1/2018
%########################################################################
%with(%
%extension,%(%else-then(%extension%,%(hpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%%include(%include_path%/file-hpp-cpp.t)%%
%#ifndef %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%
#define %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%

%if-then(%parse(%Include%,%(,)%,,,,%(#include "%Include%"
)%,Include)%%parse(%Sys_include%,%(,)%,,,,%(#include <%Include%>
)%,Include)%,
)%%
%%Namespace_begin%%
%%if-no(%is_name%,,%(%if(%Extends%,%(%if(%Name_implements%,%(typedef implement_base %Implementst%_implements;
///////////////////////////////////////////////////////////////////////
///  Class: %Implementst%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,%(template <class TImplements = %Implementst%_implements>
)%)%class _EXPORT_CLASS %Implementst%: virtual public %if-no(%is_template%,%Implementst%_implements,TImplements)% {
public:
    typedef %if-no(%is_template%,%Implementst%_implements,TImplements)% implements;

    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class _EXPORT_CLASS %Implementst%
%if-no(%is_template%,,%(typedef %Implementst%<> %Implements%;
)%)%
)%)%%if(%Implements%,%(typedef %Implements% %Namet%_implements;
)%)%typedef %Extends% %Namet%_extends;
///////////////////////////////////////////////////////////////////////
///  Class: %Namet%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,%(template <%if(%Implements%,%(class TImplements = %Namet%_implements, )%)%class TExtends = %Namet%_extends>
)%)%class _EXPORT_CLASS %Namet%: %if(%Implements%,%(virtual public %if-no(%is_template%,%Namet%_implements,TImplements)%, )%)%public %if-no(%is_template%,%Namet%_extends,TExtends)% {
public:
    %if(%Implements%,%(typedef %if-no(%is_template%,%Namet%_implements,TImplements)% implements;
    )%)%typedef %if-no(%is_template%,%Namet%_extends,TExtends)% extends;
    typedef %Namet% derives;
    %if(%Copy_constructor%%Constructor%%Destructor%,%(
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
    )%)%%if(%Copy_constructor%,%(%Namet%(const %Namet% &copy) {
    }
    )%)%%if(%Constructor%,%(%Namet%() {
    }
    )%)%%if(%Destructor%,%(virtual ~%Namet%() {
    }
)%)%
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class _EXPORT_CLASS %Namet%
%if-no(%is_template%,,%(typedef %Namet%<> %Name%;
)%)%)%,%(%if(%Implements%,%(typedef %Implements% %Namet%_implements;
///////////////////////////////////////////////////////////////////////
///  Class: %Namet%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,template <class TImplements = %Namet%_implements>
)%class _EXPORT_CLASS %Namet%: virtual public %if-no(%is_template%,%Namet%_implements,TImplements)% {
public:
    typedef %if-no(%is_template%,%Namet%_implements,TImplements)% implements;
    typedef %Namet% derives;
    %if(%Copy_constructor%%Constructor%%Destructor%,%(
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
    )%)%%if(%Copy_constructor%,%(%Namet%(const %Namet% &copy) {
    }
    )%)%%if(%Constructor%,%(%Namet%() {
    }
    )%)%%if(%Destructor%,%(virtual ~%Namet%() {
    }
)%)%
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class _EXPORT_CLASS %Namet%
%if-no(%is_template%,,typedef %Namet%<> %Name%;
)%)%,%(///////////////////////////////////////////////////////////////////////
///  Class: %Name%
///////////////////////////////////////////////////////////////////////
class _EXPORT_CLASS %Name% {
public:
    typedef %Name% derives;
    %if(%Copy_constructor%%Constructor%%Destructor%,%(
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
    )%)%%if(%Copy_constructor%,%(%Name%(const %Name% &copy) {
    }
    )%)%%if(%Constructor%,%(%Name%() {
    }
    )%)%%if(%Destructor%,%(virtual ~%Name%() {
    }
)%)%
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class _EXPORT_CLASS %Name%
)%)%)%)%)%)%%Namespace_end%
#endif /// %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION% 
%
%)%)%