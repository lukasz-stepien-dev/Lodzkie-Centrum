#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

vector<int> getData() {
    fstream file;
    int config[3];
    vector<int> randomNumbs;
    file.open("/Users/macbookpro/1 - Projects/School/Łódzkie Centrum/Lodzkie-Centrum/20.09.23 C++/dane.txt", ios::in);
    srand(time(NULL));

    if (!file) {
        cout << "FILE ERROR: Nie udało się otworzyć pliku!";
        exit(0);
    }

    for (int & numb : config) {
        file >> numb;
    }

    if (config[0] > config[1]) {
        int temp = config[0];
        config[0] = config[1];
        config[1] = temp;
    } else if (config[0] == config[1]) {
        cout << "CONFIG ERROR: Lewy kraniec i prawy kraniec przedzialu jest taki sam!";
        exit(0);
    }

    if (config[2] < 1) {
        cout << "CONFIG ERROR: Ilość liczb losująch jest ujemna!";
        exit(0);
    }

    for (int i = 0; i < config[2]; ++i) {
        randomNumbs.push_back((rand() % config[1]) + config[0]);
    }

    for (int randomNumb : randomNumbs) {
        cout << randomNumb << endl;
    }

    return randomNumbs;
}

vector<int> sort(vector<int> & numbs) {
    for(int i=0;i<numbs.size();i++)
    {
        for(int j=1;j<numbs.size()-i;j++) {
            if (numbs[j - 1] > numbs[j])
            {
                int temp = numbs[j - 1];
                numbs[j - 1] = numbs[j];
                numbs[j] = temp;
            }
        }
    }

}

int main() {
    vector<int>randomNumbs = getData();
    sort(randomNumbs);
    for (int & numb : randomNumbs) {
        cout << numb << endl;
    }

    return 0;
}