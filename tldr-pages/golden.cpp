#include<bits/stdc++.h>
#include<algorithm>
using namespace std;

vector<long> v_arr;
queue<long> q_arr;
map<string,int> m_arr;
set<int> set_arr;
stack<float> s_arr;

void test_vector();
void test_vector_with_class();
void test_string();
void test_set();

int main()
{
    //test_vector();
    //test_vector_with_class();
    //test_string();
    test_set();
    return 0;
}

class item{
    public:
        int age;
        float height;
        string name;
        item(int a,float h, string n){
            age = a;
            height = h;
            name = n;
        }
};
void operator << (ostream &out, item &i)
{
    out<<i.age<<" "<<i.height<<" "<<i.name<<endl;
}
int operator < (item &i1, item &i2)
{
//按照age -> height -> name 的顺序排序
    if(i1.age<i2.age)
        return 1;
    else if(i1.age == i2.age)
        if(i1.height < i2.height)
            return 1;
        else if(i1.height == i2.height)
            if(i1.name <= i2.name)
                return 1;
            else
                return 0;
        else
            return 0;
    else
        return 0;
}
void test_set()
{
    set<int> a={0,1,6,2,3};
    a.insert(8);
    for(auto it = a.begin();it != a.end();it++)    cout << *it;//输出01236
    a.erase(8);
    cout<<endl;
    for(auto it = a.begin();it != a.end();it++)    cout << *it;//输出01236
}
void test_vector()
{
    srand(123);
    for(int i=0;i<10;i++)
    {
        v_arr.push_back(rand()%100);
        q_arr.push(rand()%100+1000);
        s_arr.push((rand()%100)/100.0);
    }
    sort(v_arr.begin(),v_arr.end());
    for(int i=0;i<10;i++)
    {
        cout<<v_arr[i]<<endl;
        cout<<"\t"<<q_arr.front()<<endl;
        cout<<"\t\t"<<s_arr.top()<<endl;
        q_arr.pop();
        s_arr.pop();
    }
    string s="abc";
    m_arr[s] = 12;
    m_arr["abc"] = 11;
    cout<<m_arr[s]<<"map";



    set_arr.insert(2);
}
void test_vector_with_class()
{
    vector<item> v_class;
    v_class.push_back(item(12,12.2,"abc"));
    v_class.push_back(item(11,12.2,"abc"));
    v_class.push_back(item(13,12.2,"abc"));
    v_class.push_back(item(11,12.4,"abc"));
    v_class.push_back(item(11,12.2,"adc"));
    v_class.push_back(item(11,12.2,"abd"));
    sort(v_class.begin(),v_class.end());

    for(unsigned int i=0;i<v_class.size();i++)
        cout<<v_class[i];
    cout<<string::npos;
}

void test_string()
{
//find()
    string s = "#password:123456#ahaha";
    string p;
    cout<<s.find(':')<<endl;
    cout<<s.find('#')<<endl;
    cout<<s.find('@')<<endl;
//substr()
    if(s.find(":") != string::npos)
        p = s.substr(s.find(":")+1,s.size()-s.find(':'));
//erase()
//rfind()
    cout<<endl<<p<<endl;
    p.erase(p.rfind('h'));
    cout<<"after erase&&rfind:"<<p<<endl;
//append()
    p.append("000");
    p.append(6,'6');
    p.append(s,1,8);
    cout<<"after append:"<<p<<endl;
//c_str()
    const char *c_s = p.c_str();
    cout<<"c_str:"<<c_s<<endl;
}
