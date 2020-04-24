#include <fstream>
#include <iostream>
#include <typeinfo>

void print(std::ifstream& ifs);

int main() {
  std::ifstream ifs;
  ifs.rdbuf()->pubsetbuf(nullptr, 0);
  ifs.open("test.txt");
  std::streampos pos;

  print(ifs);
  print(ifs);
  pos = ifs.tellg();
  std::cout << "save the pos : " << pos << std::endl;
  print(ifs);
  print(ifs);
  print(ifs);
  ifs.seekg(pos);
  std::cout << "load the pos : " << pos << std::endl;
  print(ifs);
  print(ifs);
  print(ifs);

  return 0;
}

void print(std::ifstream& ifs) {
  char word = ifs.get();
  std::cout << ifs.tellg() << ": word \"" << word << "\"" << std::endl;
}
