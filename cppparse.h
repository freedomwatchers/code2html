#include "parser.h"

class CppParser : public Parser {
		public:
				CppParser();
				~CppParser()  { for(int i=0; i<KEYWORDS; ++i) delete [] keyWords[i]; }
				 void handle_single_comment(ifstream& inFile, ofstream& outFile);
				 void handle_multiline_comment(ifstream& inFile, ofstream& outFile);
};
