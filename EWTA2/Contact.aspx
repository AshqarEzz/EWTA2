<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Contact.aspx.cs"
    Inherits="EWTA2.Contact" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="container mt-4">

        <h1 class="fw-bold mb-4">Project Team Members</h1>

        <div class="table-responsive">

            <table class="table table-bordered table-striped">

                <thead class="table-dark">
                    <tr>
                        <th>Student Name</th>
                        <th>Student ID</th>
                        <th>Email</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>Arqam Waqar</td>
                        <td>230504610</td>
                        <td>
                            <a href="mailto:230504610@st.atlas.edu.tr">
                                230504610@st.atlas.edu.tr
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>Izzeldin Osama Jumma Alashqar</td>
                        <td>210504516</td>
                        <td>
                            <a href="mailto:210504516@st.atlas.edu.tr">
                                210504516@st.atlas.edu.tr
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>Ridha Alfllani</td>
                        <td>2305044553</td>
                        <td>
                            <a href="mailto:2305044553@st.atlas.edu.tr">
                                230504553@st.atlas.edu.tr
                            </a>
                        </td>
                    </tr>

                    <tr>
    <td>Mohammad Turkistani</td>
    <td>230504630</td>
    <td>
        <a href="mailto:230504630@st.atlas.edu.tr">
            230504630@st.atlas.edu.tr
        </a>
    </td>
</tr>

                                        <tr>
    <td>Ahmet Elibol</td>
    <td>220504015</td>
    <td>
        <a href="mailto:230504630@st.atlas.edu.tr">
            220504015@st.atlas.edu.tr
        </a>
    </td>
</tr>

                </tbody>

            </table>

        </div>

    </div>

</asp:Content>
