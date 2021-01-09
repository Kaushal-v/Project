using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Security.Policy;
public class block
{
    public string timeStamp;
    public List<Transaction> transactions { get; set; }
    public string previousHash;
    public string hash = "";
    public long nonce;
    public block(string timeStamp, List<Transaction> transactions, string previousHash)
    {
        this.transactions = transactions;
        this.timeStamp = timeStamp;
        this.previousHash = previousHash;
        this.nonce = 0;
        this.hash = this.calculateHash();
    }
    public string calculateHash()
    {

        using (SHA256 sha256 = SHA256.Create())
        {
            string s = String.Join(" ", this.transactions.Select(o => o.from.ToString() + o.to.ToString() + o.amount.ToString()));
            string rawData = this.previousHash + this.timeStamp + s + nonce;
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
            return Encoding.Default.GetString(bytes);
        }
    }
    public void mineBlock(int proofOfDeficulty)
    {
        string validateBlock = new String('0', proofOfDeficulty);
        while (hash.Substring(0, proofOfDeficulty) != validateBlock)
        {
            nonce++;
            hash = calculateHash();
        }
        //Console.WriteLine(nonce);

        //Console.WriteLine("Blocked with HASH={0} successfully mined!", hash);
    }
}
public class Transaction
{
    public string from { get; }
    public string to { get; }
    public double amount { get; }
    public Transaction(string from, string to, double amount)
    {
        this.from = from;
        this.to = to;
        this.amount = amount;
    }
}
public class blockchain
{
    public List<block> chain { get; set; }
    public List<Transaction> pendingTransactions;
    public int proofOfDifficulty;
    public double reward;

    public blockchain(int proofOfDifficulty, long reward)
    {
        this.proofOfDifficulty = proofOfDifficulty;
        this.reward = reward;
        pendingTransactions = new List<Transaction>();
        chain = new List<block> { createGenesisBlock() };
    }
    private block createGenesisBlock()
    {
        List<Transaction> transactions = new List<Transaction> { new Transaction("", "Genesis Block", 0) };
        return new block(DateTime.Now.ToString(), transactions, "0");
    }
    public block getLatestBLock()
    {
        return this.chain[this.chain.Count - 1];
    }
    public void mineBlock(string address)
    {
        Transaction minerTra = new Transaction("null", address, reward);
        pendingTransactions.Add(minerTra);
        block b = new block(DateTime.Now.ToString(), pendingTransactions, this.chain.Last().hash);
        b.mineBlock(proofOfDifficulty);
        chain.Add(b);
        pendingTransactions = new List<Transaction> { };
    }
    public void CreateTransaction(Transaction transaction)
    {
        pendingTransactions.Add(transaction);
    }
    public Boolean isValid()
    {
        for (int i = 1; i <= chain.Count() - 1; i++)
        {
            block currBlock = chain[i];
            block preBlock = chain[i - 1];
            if (currBlock.hash != currBlock.calculateHash()) return false;
            if (currBlock.previousHash != preBlock.hash) return false;
        }
        return true;
    }
    public double getBalance(string address)
    {
        double bal = 0;
        foreach (block b in chain)
        {
            foreach (Transaction tra in b.transactions)
            {
                if (tra.from.Equals(address))
                {
                    bal -= tra.amount;
                }
                if (tra.to.Equals(address))
                {
                    bal += tra.amount;
                }
            }
        }
        return bal;
    }
    public string getAddress(string u_name)
    {
        using (SHA256 sha256 = SHA256.Create())
        {            
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(u_name));
            return Encoding.Default.GetString(bytes);
        }
    }
}
//class Program
//{
    //static void Main(string[] args)
    //{
        //blockchain b1 = new blockchain(1, 10);
        //b1.CreateTransaction(new Transaction("user1Address", "user2Address", 5));
        //b1.CreateTransaction(new Transaction("user2Address", "user2Address", 15));
        //b1.mineBlock("abc");
        //b1.CreateTransaction(new Transaction("abc", "bcd", 10));
        //Console.WriteLine("BALANCE of the miner: {0}", b1.getBalance("abc"));
        //b1.mineBlock("bcd");
        //Console.WriteLine("BALANCE of the miner: {0}", b1.getBalance("bcd"));
        //PrintChain(b1);
    //}
    //private static void PrintChain(blockchain blockchain)
    //{
    //    Console.WriteLine("----------------- Start Blockchain -----------------");
    //    foreach (block block in blockchain.chain)
    //    {
    //        Console.WriteLine("------ Start Block ------");
    //        Console.WriteLine("Hash: {0}", block.hash);
    //        Console.WriteLine("Previous Hash: {0}", block.previousHash);
    //        Console.WriteLine("--- Start Transactions ---");
    //        foreach (Transaction transaction in block.transactions)
    //        {
    //            Console.WriteLine("From: {0} To {1} Amount {2}", transaction.from, transaction.to, transaction.amount);
    //        }
    //        Console.WriteLine("--- End Transactions ---");
    //        Console.WriteLine("------ End Block ------");
    //    }
    //    Console.WriteLine("----------------- End Blockchain -----------------");
    //}
//}