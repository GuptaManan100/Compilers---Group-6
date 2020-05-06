#include <bits/stdc++.h> 
using namespace std; 

string VarToReg(string var, bool check){
	string reg = "";
	int val = 0;

	if(var[0] == 'p'){
		if(var[1] == 'i'){
			val = var[2] - '0' + 13;
			return "$" + to_string(val);
		}
		else{
			val = var[2] - '0' + 13;
			return "$f" + to_string(val);
		}
	}

	if(var[0] == 'i'){
		if(check == true){
			reg = "$24";
		}
		else{
			reg = "$23";
		}
		return reg;
	}
	else if(var[0] == 'f'){
		if(check == true){
			reg = "$f24";
		}
		else{
			reg = "$f23";
		}
		return reg;
	}
 	val = var[2] - '0' + 1;
	if(var[1] == 'i'){
		val+=2;
		if(val == 12){
			val++;
		}
		reg = "$" + to_string(val);
	}
	else{
		val+=2;
		if(val == 12){
			val++;
		}
		reg = "$f" + to_string(val);
	}	
	return reg;
} 

string Relop(string op){
	string relop = "NO";
	if(op == "<="){
		relop = "ble";
	}
	if(op == "=="){
		relop = "beq";
	}
	if(op == "<"){
		relop = "blt";
	}
	if(op == ">"){
		relop = "bgt";
	}
	if(op == "!="){
		relop = "bne";
	}
	if(op == ">="){
		relop = "bge";
	}
	return relop;
}

string FRelop(string op){
	string frelop = "NO";
	if(op == "<="){
		frelop = "c.le.s";
	}
	if(op == "=="){
		frelop = "c.eq.s";
	}
	if(op == "<"){
		frelop = "c.lt.s";
	}
	if(op == ">"){
		frelop = "c.gt.s";
	}
	if(op == "!="){
		frelop = "c.ne.s";
	}
	if(op == ">="){
		frelop = "c.ge.s";
	}
	return frelop;
}

string FuncOp(string func){
	if(func == "+"){
		return "add";
	}
	if(func == "-"){
		return "sub";
	}
	if(func == "*"){
		return "mul";
	}
	if(func == "/"){
		return "div";
	}
}

string FFuncOp(string func){
	if(func == "+"){
		return "add.s";
	}
	if(func == "-"){
		return "sub.s";
	}
	if(func == "*"){
		return "mul.s";
	}
	if(func == "/"){
		return "div.s";
	}
}

string FuncRelop(string op){
	string relop = "NO";
	if(op == "<="){
		relop = "sle";
	}
	if(op == "=="){
		relop = "seq";
	}
	if(op == "<"){
		relop = "slt";
	}
	if(op == ">"){
		relop = "sgt";
	}
	if(op == "!="){
		relop = "sne";
	}
	if(op == ">="){
		relop = "sge";
	}
	return relop;
}

bool checkTemp(string word){
	if(word[0] == 't' || word[0] == 'p'){
		return true;
	}
	return false;
}

bool checkOp(string word){
	if(word  == "+" || word == "-" || word == "/" || word == "*"){
		return true;
	}
	return false;
}

bool checkRelop(string word){
	if(word == "<" || word == ">" || word == "<=" || word == ">=" || word == "==" || word == "!="){
		return true;
	}
	return false;
}

bool isNum(string word){
	if(word[0] >= '0' && word[0] <= '9'){
		return true;
	}
	return false;
}

void saveTempReg(ofstream& Ostream){
	for(int i=3;i<=21;i++){
		string reg = "$" + to_string(i);
		Ostream << "sw "<< reg << ", -4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
	for(int i=3;i<=21;i++){
		string reg = "$f" + to_string(i);
		Ostream << "s.s "<< reg << ", -4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
	return;
}

void saveVars(ofstream& Ostream){
	Ostream << "li $25, 0x10010000" << endl;
	for(int i=0;i<100;i+=4){
		Ostream << "lw $22, " << i << "($25)" << endl;
		Ostream << "sw $22, -4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
	Ostream << "li $25, 0x10020000" << endl;
	for(int i=0;i<100;i+=4){
		Ostream << "l.s $f22, " << i << "($25)" << endl;
		Ostream << "s.s $f22, -4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
}

void saveParams(ofstream& Ostream){
	Ostream << "li $25, 0x10030000" << endl;

	for(int i=0;i<=28;i+=4){
		Ostream << "lw $22, " << i << "($25)" << endl;
		Ostream << "sw $22, -4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
	Ostream << "li $25, 0x10035000" << endl;

	for(int i=0;i<=28;i+=4){
		Ostream << "l.s $f22, " << i << "($25)" << endl;
		Ostream << "s.s $f22, -4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
}

void restoreParams(ofstream& Ostream){
	Ostream << "la $sp, 64($sp)" << endl;
}

void restoreVars(ofstream& Ostream){
	Ostream << "li $25, 0x10020000" << endl;
	for(int i=96;i>=0;i-=4){
		Ostream << "l.s $f22, ($sp)" << endl;
		Ostream << "la $sp, 4($sp)" << endl;
		Ostream << "s.s $f22, " << i << "($25)" << endl;
	}
	Ostream << "li $25, 0x10010000" << endl;
	for(int i=96;i>=0;i-=4){
		Ostream << "lw $22, ($sp)" << endl;
		Ostream << "la $sp, 4($sp)" << endl;
		Ostream << "sw $22, " << i << "($25)" << endl;
	}
}

void restoreTempReg(ofstream& Ostream){
	for(int i=21;i>=3;i--){
		string reg = "$f" + to_string(i);
		Ostream << "l.s "<< reg << ", ($sp)" << endl;
		Ostream << "la $sp, 4($sp)" << endl;
	}
	for(int i=21;i>=3;i--){
		string reg = "$" + to_string(i);
		Ostream << "lw "<< reg << ", ($sp)" << endl;
		Ostream << "la $sp, 4($sp)" << endl;
	}
	return;
}

void getJump(ofstream& Ostream){
	Ostream << "lw $ra, ($sp)" << endl;
	Ostream << "la $sp, 4($sp)" << endl;
}

void saveJump(ofstream& Ostream){
	Ostream << "sw $ra, -4($sp)" << endl;
	Ostream << "la $sp, -4($sp)" << endl;
}

void getParams(ofstream& Ostream){
	int val = 200 + 4 + 152 + 64; //vars + jump add + temp int/float + parameters
	Ostream << "la $sp, " << val << "($sp)" << endl;

	for(int i=14;i<22;i++){
		Ostream << "lw $" << i << ", " << "-4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
	for(int i=14;i<22;i++){
		Ostream << "l.s $f" << i << ", " << "-4($sp)" << endl;
		Ostream << "la $sp, -4($sp)" << endl;
	}
	Ostream << "la $sp, -356($sp)" << endl;
}

void getReturn(ofstream& Ostream, bool check){
	if(check){
		Ostream << "l.s $f2, ($sp)" << endl;
		Ostream << "la $sp, 4($sp)" << endl;
	}
	else{
		Ostream << "lw $2, ($sp)" << endl;
		Ostream << "la $sp, 4($sp)" << endl;
	}
}

string getAdd(string word){
	if(word[0] == 'i'){
		return "0x10010000";
	}
	if(word[0] == 'f'){
		return "0x10020000";
	}
}

int getOffset(string word){
	word = word.substr(1,word.length()-1);
	int val = 4*stoi(word);
	return val;
}

bool isFloat(string word){
	for(int i=0;i<word.length();i++){
		if(word[i] == 'f' || word[i] == '.'){
			return true;
		}
	}
	return false;
}

int main(){
	fstream Istream;
	string word;
	Istream.open("intermediate.txt");
	ofstream Ostream("output.asm"); 
	int fLabel = 1;
	int intOffset = 0;
	int floatOffset = 0;
	int count = 1;

	while(Istream >> word){
		startagain:
		// Ostream << count << ":\n";
		// count++;
		if(word == "goto"){  
			Istream >> word;
			Ostream << "j " << word << endl;
		}
		else if(word[0] == 'L'){  
			Ostream << word << endl;
		}
		else if(word == "param"){ 
			Istream >> word;
			string reg = VarToReg(word, false);
			if(!isFloat(word)){
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "lw " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Ostream << "li $25, 0x10030000" << endl;
				Ostream << "sw "<< reg << ", " << intOffset << "($25)" << endl;
				intOffset += 4;
			}
			else{
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "l.s " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Ostream << "li $25, 0x10035000" << endl;
				Ostream << "s.s "<< reg << ", " << floatOffset << "($25)" << endl;
				floatOffset +=4;
			}
		}
		else if(word == "call"){
			intOffset = 0;
			floatOffset = 0;  
			saveParams(Ostream);
			saveJump(Ostream);
			saveTempReg(Ostream);
			saveVars(Ostream);
			Istream >> word;
			word = word.substr(0,word.length()-1);
			string label = word;
			Istream >> word;
			int params = stoi(word); 
			Ostream << "jal " << label << endl;
			getReturn(Ostream,false);
			restoreVars(Ostream);
			restoreTempReg(Ostream);
			getJump(Ostream);
			restoreParams(Ostream);
		}
		else if(word == "func"){
			Istream >> word;
			if(word == "begin"){
				Istream >> word;
				Ostream << word << ":" << endl;
				if(word != "main"){
					getParams(Ostream);
				}
			}   
			if(word == "end"){
				Ostream << "la $sp, -4($sp)" << endl; 
				Ostream << "jr $ra" <<endl;
			}
		}
		else if(word == "ifFalse"){ 
			Istream >> word;
			string reg = VarToReg(word, false);
			if(!isFloat(word)){
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "lw " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Istream >> word;
				if(word == "goto"){
					Istream >> word;
					Ostream << "beq " << reg << ", $0, " << word << endl;
				}
			}
			else{
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "l.s " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Istream >> word;
				if(word == "goto"){
					Istream >> word;
					Ostream << "li.s $f0, 0.0" << endl;
					Ostream << "c.eq.s " << reg << ", $f0" << endl;
					Ostream << "bc1t " << word << endl;
				}
			}
		}
		else if(word == "if"){ 
			Istream >> word;
			string reg = VarToReg(word, false);

			if(!isFloat(word)){
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "lw " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Istream >> word;
				if(word == "goto"){
					Istream >> word;
					Ostream << "bne " << reg << ", $0, " << word << endl; 
				}
				else{
					string op = word;
					string relop = Relop(op);
					Istream >> word;
					string sReg = VarToReg(word, true);
					if(!checkTemp(word) && !isFloat(word)){
						Ostream << "li $25, " << getAdd(word) << endl;
					    Ostream << "lw " << sReg << ", " << getOffset(word) << "($25)" << endl;
					}
					else if(!checkTemp(word) && isFloat(word)){
						Ostream << "li $25, " << getAdd(word) << endl;
					    Ostream << "l.s " << sReg << ", " << getOffset(word) << "($25)" << endl;
					}

					if(!isFloat(word)){
							Ostream << "add $21, " << sReg << ", $0" << endl;
					}
					else{
						Ostream << "cvt.w.s " << "$f21" << ", " << sReg << endl;
						Ostream << "mfc1 " << "$21" << ", " << "$f21" << endl;
					}
					Istream >> word;
					if(word == "goto"){
						Istream >> word;
						Ostream << relop << " " << reg << ", " << "$21" << ", " << word << endl;
					}
				}
			}
			else{
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "l.s " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Istream >> word;
				if(word == "goto"){
					Istream >> word;
					Ostream << "li.s $f0, 0.0" << endl;
					Ostream << "c.ne.s " << reg << ", $f0" << endl;
					Ostream << "bc1t " << word << endl;
				}
				else{
					string op = word;
					string frelop = FRelop(op);
					Istream >> word;
					string sReg = VarToReg(word, true);
					if(!checkTemp(word) && isFloat(word)){
						Ostream << "li $25, " << getAdd(word) << endl;
					    Ostream << "l.s " << sReg << ", " << getOffset(word) << "($25)" << endl;
					}
					if(!checkTemp(word) && !isFloat(word)){
						Ostream << "li $25, " << getAdd(word) << endl;
					    Ostream << "lw " << sReg << ", " << getOffset(word) << "($25)" << endl;
					}
					if(!isFloat(word)){
						Ostream << "mtc1 " << sReg << ", $f21" << endl;
						Ostream << "cvt.s.w " << "$f21, $f21" << endl;
					}
					else{
						Ostream << "mov.s $f21, " << sReg << endl;
					}
					Istream >> word;
					if(word == "goto"){
						Istream >> word;
						Ostream << frelop << " " << reg << ", " << "$f21" << endl;
						Ostream << "bc1t " << ", " << word << endl;
					}
				}
			}
		}
		else if(word == "printf("){
			Istream >> word;
			string reg = VarToReg(word,false);
			if(!isFloat(word)){
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "lw " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Ostream << "li $v0, 1" << endl;
				Ostream << "add $25, $a0, $0" << endl;
				Ostream << "add $a0, " << reg << ", $0" << endl;
				Ostream << "syscall" << endl; 
				Ostream << "add $a0, $25, $0" << endl;
			}
			else{
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "l.s " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Ostream << "li $v0, 2" << endl;
				Ostream << "mov.s $f12, " << reg << endl;
				Ostream << "syscall" << endl;  
			}
			Istream >> word; 
		}
		else if(word == "return"){
			Istream >> word;
			string reg = VarToReg(word,false);
			if(!isFloat(reg)){
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "lw " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Ostream << "sw " << reg << ", -4($sp)" << endl;
				Ostream << "la $sp, -4($sp)" << endl; 
				Ostream << "jr $ra" <<endl; 
			}
			else{
				if(!checkTemp(word)){
					Ostream << "li $25, " << getAdd(word) << endl;
					Ostream << "l.s " << reg << ", " << getOffset(word) << "($25)" << endl;
				}
				Ostream << "s.s " << reg << ", -4($sp)" << endl;
				Ostream << "la $sp, -4($sp)" << endl; 
				Ostream << "jr $ra" <<endl; 
			}
		}
		else if(word == "HALT"){
			Ostream << "li $v0, 10" << endl;
			Ostream << "syscall" << endl;   
		}
		else if(word[0] == 'p' || word[0] == 't' || word[0] == 'i' || word[0] == 'f'){ 
			string reg = word;
			Istream >> word;
			if(!isFloat(reg)){
				if(word == "="){
					Istream >> word;
					if(word[0] == '!'){
						word = word.substr(1,word.length()-1);
						string sReg = VarToReg(word,false);
						if(!checkTemp(word)){
							Ostream << "li $25, " << getAdd(word) << endl;
							Ostream << "lw " << sReg << ", " << getOffset(word) << "($25)" << endl;
						}
						else{
							if(!checkTemp(reg)){
								Ostream << "neg $22, " << sReg << endl;
								Ostream << "li $25, " << getAdd(reg) << endl;
								Ostream << "sw $22, " << getOffset(reg) << "($25)" << endl;
							}
							else{
								Ostream << "neg " << VarToReg(reg, false) << ", " << sReg << endl;
							}
						}
					}
					else if(word == "call"){
						intOffset = 0;
						floatOffset = 0;  
						saveParams(Ostream);
						saveJump(Ostream);
						saveTempReg(Ostream);
						saveVars(Ostream);
						Istream >> word;
						word = word.substr(0,word.length()-1);
						string label = word;
						Istream >> word;
						int params = stoi(word); 
						Ostream << "jal " << label << endl;
						getReturn(Ostream,false);
						restoreVars(Ostream);
						restoreTempReg(Ostream);
						getJump(Ostream);
						restoreParams(Ostream);
						if(!checkTemp(reg)){
							Ostream << "li $25, " << getAdd(reg) << endl;
					     	Ostream << "sw $2, " << getOffset(reg) << "($25)" << endl;
						}
						else{
							Ostream << "add " << VarToReg(reg, false) <<", $2, $0" << endl;
						}
					}
					else if(!isNum(word)){
						string sReg = VarToReg(word,false);
						string wordy = word;
						if(!checkTemp(word) && !isFloat(word)){
							Ostream << "li $25, " << getAdd(word) << endl;
							Ostream << "lw " << sReg << ", " << getOffset(word) << "($25)" << endl;
						}
						else if(!checkTemp(word) && isFloat(word)){
							Ostream << "li $25, " << getAdd(word) << endl;
							Ostream << "l.s " << sReg << ", " << getOffset(word) << "($25)" << endl;
						}
						if(!isFloat(word)){
							Ostream << "add $20, " << sReg << ", $0" << endl;
						}
						else{
							Ostream << "cvt.w.s " << "$f20" << ", " << sReg << endl;
							Ostream << "mfc1 " << "$20" << ", " << "$f20" << endl;
						}
						Istream >> word;
						if(checkOp(word) || checkRelop(word)){
							string func = "";
							if(checkRelop(word)){
								func = FuncRelop(word);
							}
							if(checkOp(word)){
								func = FuncOp(word);
							}
							Istream >> word;
							string ssReg = VarToReg(word,true);
							if(!checkTemp(word) && !isFloat(word)){
								Ostream << "li $25, " << getAdd(word) << endl;
								Ostream << "lw " << ssReg << ", " << getOffset(word) << "($25)" << endl;
							}
							else if(!checkTemp(word) && isFloat(word)){
								Ostream << "li $25, " << getAdd(word) << endl;
								Ostream << "l.s " << ssReg << ", " << getOffset(word) << "($25)" << endl;
							}
							if(!isFloat(word)){
								Ostream << "add $21, " << ssReg << ", $0" << endl;
							}
							else{
								Ostream << "cvt.w.s " << "$f21" << ", " << ssReg << endl;
								Ostream << "mfc1 " << "$21" << ", " << "$f21" << endl;
							}
							Ostream << func << " $22, " << "$20" << ", " << "$21" << endl;
							if(!checkTemp(reg)){
								Ostream << "li $25, " << getAdd(reg) << endl;
								Ostream << "sw $22, " << getOffset(reg) << "($25)" << endl;
							}
							else{
								Ostream << "add " << VarToReg(reg,false) << ", $22, $0" << endl;
							}
						}
						else{
							if(!checkTemp(reg)){
								Ostream << "li $25, " << getAdd(reg) << endl;
								Ostream << "sw " << "$20" << ", " << getOffset(reg) << "($25)" << endl;
							}
							else{
								Ostream << "add " << VarToReg(reg,false) << ", $20, $0" << endl;
							}
							goto startagain;
						}
					}
					else{
						Ostream << "li $22, " << word << endl;
						if(!checkTemp(reg)){
							Ostream << "li $25, " << getAdd(reg) << endl;
							Ostream << "sw $22, " << getOffset(reg) << "($25)" << endl;
						}
						else{
							Ostream << "add " << VarToReg(reg,false) << ", $22, $0" << endl;
						}
					}
				}
			}
			else{
				if(word == "="){
					Istream >> word;
					if(word[0] == '!'){
						word = word.substr(1,word.length()-1);
						string sReg = VarToReg(word,false);
						if(!checkTemp(word)){
							Ostream << "li $25, " << getAdd(word) << endl;
							Ostream << "l.s " << sReg << ", " << getOffset(word) << "($25)" << endl;
						}
						else{
							if(!checkTemp(reg)){
								Ostream << "neg.s $f22, " << sReg << endl;
								Ostream << "li $25, " << getAdd(reg) << endl;
								Ostream << "s.s $f22, " << getOffset(reg) << "($25)" << endl;
							}
							else{
								Ostream << "neg.s " << VarToReg(reg, false) << ", " << sReg << endl;
							}
						}
					}
					else if(word == "call"){
						intOffset = 0;
						floatOffset = 0;  
						saveParams(Ostream);
						saveJump(Ostream);
						saveTempReg(Ostream);
						saveVars(Ostream);
						Istream >> word;
						word = word.substr(0,word.length()-1);
						string label = word;
						Istream >> word;
						int params = stoi(word); 
						Ostream << "jal " << label << endl;
						getReturn(Ostream,true);
						restoreVars(Ostream);
						restoreTempReg(Ostream);
						getJump(Ostream);
						restoreParams(Ostream);
						if(!checkTemp(reg)){
							Ostream << "li $25, " << getAdd(reg) << endl;
					     	Ostream << "s.s $f2, " << getOffset(reg) << "($25)" << endl;
						}
						else{
							Ostream << "mov.s " << VarToReg(reg, false) <<", $f2" << endl;
						}
					}
					else if(!isNum(word)){
						string sReg = VarToReg(word,false);
						string wordy = word;
						if(!checkTemp(word) && isFloat(word)){
							Ostream << "li $25, " << getAdd(word) << endl;
							Ostream << "l.s " << sReg << ", " << getOffset(word) << "($25)" << endl;
						}
						else if(!checkTemp(word) && !isFloat(word)){
							Ostream << "li $25, " << getAdd(word) << endl;
							Ostream << "lw " << sReg << ", " << getOffset(word) << "($25)" << endl;
						}
						if(!isFloat(word)){
							Ostream << "mtc1 " << sReg << ", $f20" << endl;
							Ostream << "cvt.s.w " << "$f20, $f20" << endl;
						}
						else{
							Ostream << "mov.s $f20, " << sReg << endl;
						}
						Istream >> word;
						if(checkOp(word) || checkRelop(word)){
							string func = "";
							if(checkOp(word)){
								func = FFuncOp(word);
								Istream >> word;
								string ssReg = VarToReg(word,true);
								if(!checkTemp(word) && isFloat(word)){
									Ostream << "li $25, " << getAdd(word) << endl;
									Ostream << "l.s " << ssReg << ", " << getOffset(word) << "($25)" << endl;
								}
								if(!checkTemp(word) && !isFloat(word)){
									Ostream << "li $25, " << getAdd(word) << endl;
									Ostream << "lw " << ssReg << ", " << getOffset(word) << "($25)" << endl;
								}
								if(!isFloat(word)){
									Ostream << "mtc1 " << ssReg << ", $f21" << endl;
									Ostream << "cvt.s.w " << "$f21, $f21" << endl;
								}
								else{
									Ostream << "mov.s $f21, " << ssReg << endl;
								}
								Ostream << func << " $f22, " << "$f20" << ", " << "$f21" << endl;
								if(!checkTemp(reg)){
									Ostream << "li $25, " << getAdd(reg) << endl;
									Ostream << "s.s $f22, " << getOffset(reg) << "($25)" << endl;
								}
								else{
									Ostream << "mov.s " << VarToReg(reg,false) << ", $f22" << endl; 
								}
							}
						}
						else{
							if(!checkTemp(reg)){
								Ostream << "li $25, " << getAdd(reg) << endl;
								Ostream << "s.s " << "$f20" << ", " << getOffset(reg) << "($25)" << endl;
							}
							else{
								Ostream << "mov.s " << VarToReg(reg,false) << ", " << "$f20" << endl;
							}
							goto startagain;
						}
					}
					else{
						Ostream << "li.s $f22, " << word << endl;
						if(!checkTemp(reg)){
							Ostream << "li $25, " << getAdd(reg) << endl;
							Ostream << "s.s $f22, " << getOffset(reg) << "($25)" << endl;
						}
						else{
							Ostream << "mov.s " << VarToReg(reg,false) << ", $f22" << endl;
						}
					}
				}
			}
		}
	}
	Ostream << "li $v0,10" << endl;
	Ostream << "syscall" << endl;
 	Istream.close();
	Ostream.close();

	return 0;
}