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
%#   File: hpp-cpp.t
%#
%# Author: $author$
%#   Date: 4/13/2018
%########################################################################
%with(%
%name,%(%else-then(%do(%if-no(%is_name%,,%name%)%)%,%(%else-then(%do(%if-no(%is_name%,,%name%)%)%,%(%if-no(%is_name%,,name)%)%)%)%)%)%,%
%Name,%(%else-then(%Name%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%implements,%(%else-then(%if-no(%is_implements%,,%implements%)%,%(%if-no(%is_implements%,,%Name%_implement)%)%)%)%,%
%Implements,%(%else-then(%Implements%,%(%implements%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_Implements%,%(%tolower(%Implements%)%)%)%)%,%
%extends,%(%else-then(%if-no(%is_extends%,,%extends%)%,%(%if-no(%is_extends%,,base)%)%)%)%,%
%Extends,%(%else-then(%Extends%,%(%extends%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_Extends%,%(%tolower(%Extends%)%)%)%)%,%
%file,%(%else-then(%do(%file%)%,%(%else-then(%Name%,%(name)%)%)%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%base,%(%else-then(%base%,%(%filebase(%File%)%)%)%)%,%
%Base,%(%else-then(%Base%,%(%base%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_Base%,%(%tolower(%Base%)%)%)%)%,%
%header,%(%else-then(%header%,%(hpp)%)%)%,%
%Header,%(%else-then(%Header%,%(%header%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%cheader,%(%else-then(%cheader%,%(CHeader)%)%)%,%
%CHeader,%(%else-then(%CHeader%,%(hxx)%)%)%,%
%CHEADER,%(%else-then(%CHEADER%,%(%toupper(%CHeader%)%)%)%)%,%
%cheader,%(%else-then(%_CHeader%,%(%tolower(%CHeader%)%)%)%)%,%
%extension,%(%else-then(%extension%,%(hpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%directory,%(%else-then(%if-no(%is_directory%,,%directory%)%,%(%else-then(%if-no(%is_ifndef%,,%ifndef_directory%)%,%(%if-no(%is_ifndef%,,xos)%)%)%)%)%)%,%
%Directory,%(%else-then(%Directory%,%(%directory%)%)%)%,%
%DIRECTORY,%(%else-then(%DIRECTORY%,%(%toupper(%Directory%)%)%)%)%,%
%directory,%(%else-then(%_Directory%,%(%tolower(%Directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%if-no(%is_ifndef%,,%ifndef_directory%)%,%(%if-no(%is_ifndef%,,%Directory%)%)%)%)%,%
%Ifndef_directory,%(%else-then(%Ifndef_directory%,%(%ifndef_directory%)%)%)%,%
%Ifndef_directory,%(%
%%then-if(%parse(%Ifndef_directory%,/,,_)%,_)%%
%)%,%
%IFNDEF_DIRECTORY,%(%else-then(%IFNDEF_DIRECTORY%,%(%toupper(%Ifndef_directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%_Ifndef_directory%,%(%tolower(%Ifndef_directory%)%)%)%)%,%
%include_directory,%(%else-then(%include_directory%,%(%Directory%)%)%)%,%
%Include_directory,%(%else-then(%Include_directory%,%(%include_directory%)%)%)%,%
%include,%(%else-then(%do(%if-no(%is_include%,,%include%)%)%,%(%if-no(%is_include%,,xos/base/Base.hpp)%)%)%)%,%
%Include,%(%else-then(%Include%,%(%include%)%)%)%,%
%sys_include,%(%else-then(%sys_include%,%()%)%)%,%
%Sys_include,%(%else-then(%Sys_include%,%(%sys_include%)%)%)%,%
%namespace,%(%else-then(%if-no(%is_namespace%,,%namespace%)%,%(%if-no(%is_namespace%,,%Include_directory%)%)%)%)%,%
%Namespace,%(%else-then(%Namespace%,%(%namespace%)%)%)%,%
%Namespace_begin,%(%else-then(%Namespace_begin%,%(%
%%if(%Namespace%,%(%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%
)%)%)%)%)%,%
%Namespace_end,%(%else-then(%Namespace_end%,%(%
%%if(%Namespace%,%(
%reverse-parse(%Namespace%,/,,,,%(} /// namespace %ns%
)%,ns)%)%)%)%)%)%,%
%cNamespace_begin,%(%if(%Namespace%,%(#if defined(__cplusplus)
%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%#endif /*/ defined(__cplusplus) /*/
)%)%)%,%
%cNamespace_end,%(%if(%Namespace%,%(
#if defined(__cplusplus)
%reverse-parse(%Namespace%,/,,,,%(} /*/ namespace %ns% /*/
)%,ns)%#endif /*/ defined(__cplusplus) /*/
)%)%)%,%
%c_namespace,%(%else-then(%c_namespace%,%(c_NAMESPACE)%)%)%,%
%c_NAMESPACE,%(%else-then(%c_NAMESPACE%,%(%c_namespace%)%)%)%,%
%cnamespace_begin,%(%else-then(%cnamespace_begin%,%(#if defined(%c_NAMESPACE%)
namespace %c_NAMESPACE% {
#endif /* defined(%c_NAMESPACE%) */
)%)%)%,%
%CNamespace_begin,%(%else-then(%CNamespace_begin%,%(%cnamespace_begin%)%)%)%,%
%cnamespace_end,%(%else-then(%cnamespace_end%,%(
#if defined(%c_NAMESPACE%)
} /* namespace %c_NAMESPACE% */
#endif /* defined(%c_NAMESPACE%) */
)%)%)%,%
%CNamespace_end,%(%else-then(%CNamespace_end%,%(%cnamespace_end%)%)%)%,%
%enum_do,%(%else-then(%enum_do%,%(%else-then(%left(%enum_name%,/)%,%(%else-then(%enum_name%,%(%Name%)%)%)%)%)%)%)%,%
%Enum_do,%(%else-then(%Enum_do%,%(%enum_do%)%)%)%,%
%enum_undo,%(%else-then(%enum_undo%,%(%right(%enum_name%,/)%)%)%)%,%
%Enum_undo,%(%else-then(%Enum_undo%,%(%enum_undo%)%)%)%,%
%enum_name,%(%else-then(%Enum_do%,%(%else-then(%enum_name%,%(%Name%)%)%)%)%)%,%
%Enum_name,%(%else-then(%Enum_name%,%(%enum_name%)%)%)%,%
%enum_value,%(%else-then(%enum_value%,%(%if-then(%Enum_undo%,Success;)%%Enum_do%Success;%Enum_do%Failed;%if-then(%Enum_undo%,Failed;)%%Enum_do%Busy;%Enum_do%Interrupted;%Enum_do%Invalid;%if-then(%Enum_undo%,Busy;%Enum_undo%Interrupted;%Enum_undo%Invalid;)%)%)%)%,%
%Enum_value,%(%else-then(%Enum_value%,%(%enum_value%)%)%)%,%
%%(%
%%include(%filepath(%input%)%/%Prefix%%Extension%.t)%%
%)%)%