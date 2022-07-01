#include <bits/stdc++.h>
using namespace std;

vector<int> toBinary(string s){
	vector<int> ans;
	for(int i=0;i<s.size();i++){
		int temp= int(s[i]);
		vector<int> vec;
		while(temp>0){
			vec.push_back(temp%2);
			temp=temp/2;
		}
		while(vec.size()<8){
			vec.push_back(0);
		}
		reverse(vec.begin(),vec.end());
		for(int i=0;i<vec.size();i++){
			ans.push_back(vec[i]);
		}
		vec.clear();
	}
	
	return ans;
}

int main(){
	string s="hardware";
	vector<int> vec;
	vec=toBinary(s);
	for(int i=0;i<vec.size();i++){
		cout<<vec[i];
	}
}