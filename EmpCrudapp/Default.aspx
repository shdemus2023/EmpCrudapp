<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmpCrudapp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Crud</title>
    <style>
        body {
            text-align: center;
        }

        .form {
            display: flex;
            flex-direction: column;
            border: 1px solid #CCC;
            border-radius: 10px;
            padding: 20px;
        }

        .form-control {
            display: flex;
            justify-content: space-between;
            gap: 5px;
            margin-bottom: 20px;
            text-align: left;            
        }

        input[type="submit"] {
            margin-bottom: 10px;
        }

        section {
            display: flex;
            justify-content: center;
            margin: 50px auto;
        }
    </style>
</head>
<body>

    <h1>Employee Information</h1>

    <form id="form1" runat="server">
        <section>
            <div class="form">

                <div class="form-control">
                    <label for="TextBox1" id="name-label">Name</label>
                    <asp:TextBox ID="txtName" runat="server" MaxLength="10"></asp:TextBox>
                </div>

                <div class="form-control">
                    <label for="TextBox2" id="email-label">City</label>
                    <asp:TextBox ID="txtCity" runat="server" MaxLength="10"></asp:TextBox>
                </div>

                <div class="form-control">
                    <label for="TextBox3" id="number-label">Salary</label>
                    <asp:TextBox ID="txtSalary" runat="server" TextMode="Number"></asp:TextBox>
                </div>


                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn" />

                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn" />

                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="btn" />
            </div>
        </section>


        <section>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </section>


    </form>



</body>
</html>
