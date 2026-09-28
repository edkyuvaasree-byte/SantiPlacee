<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html> 

<html> 

<head> 

<meta charset="UTF-8"> 

<title>SantiHer - Restroom Management</title> 

<style> 
 
* { 
    box-sizing: border-box; 
    margin: 0; 
    padding: 0; 
} 
 
body { 
    font-family: Arial, Helvetica, sans-serif; 
    background: 
        radial-gradient(circle at 15% 20%, #3b214f 0%, transparent 35%), 
        radial-gradient(circle at 85% 80%, #4b263d 0%, transparent 35%), 
        #100d16; 
    color: #f5eef7; 
    min-height: 100vh; 
} 
 
.navbar { 
    height: 75px; 
    display: flex; 
    align-items: center; 
    justify-content: space-between; 
    padding: 0 40px; 
    background: rgba(25, 20, 31, 0.78); 
    border-bottom: 1px solid rgba(255,255,255,0.08); 
    backdrop-filter: blur(15px); 
} 
 
.logo-area { 
    display: flex; 
    align-items: center; 
    gap: 12px; 
} 
 
.logo { 
    width: 42px; 
    height: 42px; 
    border-radius: 13px; 
    display: flex; 
    align-items: center; 
    justify-content: center; 
    font-size: 20px; 
    font-weight: bold; 
    background: linear-gradient(135deg, #e6b7ff, #b76cff); 
    color: #211329; 
    box-shadow: 0 0 25px rgba(183,108,255,0.35); 
} 
 
.brand { 
    font-size: 22px; 
    font-weight: bold; 
} 
 
.brand span { 
    color: #d69cff; 
} 
 
.dashboard-btn { 
    text-decoration: none; 
    color: #eee; 
    padding: 10px 18px; 
    border-radius: 10px; 
    background: rgba(255,255,255,0.07); 
    border: 1px solid rgba(255,255,255,0.1); 
    transition: 0.3s; 
} 
 
.dashboard-btn:hover { 
    background: rgba(255,255,255,0.14); 
    transform: translateY(-2px); 
} 
 
.container { 
    padding: 40px; 
    max-width: 1450px; 
    margin: auto; 
} 
 
.page-header { 
    display: flex; 
    justify-content: space-between; 
    align-items: center; 
    margin-bottom: 30px; 
} 
 
.page-title { 
    font-size: 34px; 
    margin-bottom: 8px; 
} 
 
.page-subtitle { 
    color: #aaa0b1; 
    font-size: 14px; 
} 
 
.add-btn { 
    border: none; 
    cursor: pointer; 
    padding: 13px 22px; 
    border-radius: 12px; 
    background: linear-gradient(135deg, #dca6ff, #a95cff); 
    color: #201126; 
    font-weight: bold; 
    font-size: 14px; 
    transition: 0.3s; 
    box-shadow: 0 8px 25px rgba(169,92,255,0.2); 
} 
 
.add-btn:hover { 
    transform: translateY(-3px); 
    box-shadow: 0 12px 30px rgba(169,92,255,0.35); 
} 
 
.summary-grid { 
    display: grid; 
    grid-template-columns: repeat(3, 1fr); 
    gap: 20px; 
    margin-bottom: 30px; 
} 
 
.summary-card { 
    padding: 24px; 
    border-radius: 18px; 
    background: rgba(255,255,255,0.055); 
    border: 1px solid rgba(255,255,255,0.09); 
    backdrop-filter: blur(18px); 
    transition: 0.3s; 
} 
 
.summary-card:hover { 
    transform: translateY(-4px); 
    border-color: rgba(214,156,255,0.3); 
} 
 
.summary-label { 
    color: #aaa0b1; 
    font-size: 13px; 
    margin-bottom: 10px; 
} 
 
.summary-number { 
    font-size: 32px; 
    font-weight: bold; 
} 
 
.table-card { 
    background: rgba(255,255,255,0.045); 
    border: 1px solid rgba(255,255,255,0.08); 
    border-radius: 20px; 
    padding: 25px; 
    backdrop-filter: blur(18px); 
    overflow-x: auto; 
} 
 
table { 
    width: 100%; 
    border-collapse: collapse; 
} 
 
thead { 
    background: rgba(255,255,255,0.05); 
} 
 
th { 
    text-align: left; 
    padding: 16px 12px; 
    font-size: 12px; 
    color: #b8aebe; 
    text-transform: uppercase; 
    letter-spacing: 0.5px; 
} 
 
td { 
    padding: 17px 12px; 
    border-top: 1px solid rgba(255,255,255,0.06); 
    font-size: 13px; 
    color: #eee8f0; 
} 
 
tbody tr { 
    transition: 0.25s; 
} 
 
tbody tr:hover { 
    background: rgba(255,255,255,0.035); 
} 
 
.status { 
    display: inline-block; 
    padding: 6px 11px; 
    border-radius: 20px; 
    font-size: 11px; 
    font-weight: bold; 
} 
 
.clean { 
    background: rgba(85, 220, 150, 0.12); 
    color: #70e0a4; 
} 
 
.attention { 
    background: rgba(255, 178, 75, 0.13); 
    color: #ffc16b; 
} 
 
.action-area { 
    display: flex; 
    gap: 8px; 
} 
 
.edit-btn { 
    border: none; 
    cursor: pointer; 
    padding: 7px 12px; 
    border-radius: 8px; 
    background: rgba(170,110,255,0.15); 
    color: #d7a5ff; 
    transition: 0.25s; 
} 
 
.edit-btn:hover { 
    background: rgba(170,110,255,0.28); 
    transform: translateY(-2px); 
} 
 
.delete-btn { 
    text-decoration: none; 
    padding: 7px 12px; 
    border-radius: 8px; 
    background: rgba(255,80,100,0.12); 
    color: #ff8998; 
    transition: 0.25s; 
} 
 
.delete-btn:hover { 
    background: rgba(255,80,100,0.25); 
    transform: translateY(-2px); 
} 
 
.modal { 
    display: none; 
    position: fixed; 
    z-index: 1000; 
    left: 0; 
    top: 0; 
    width: 100%; 
    height: 100%; 
    background: rgba(0,0,0,0.72); 
    backdrop-filter: blur(7px); 
    align-items: center; 
    justify-content: center; 
} 
 
.modal-content { 
    width: 500px; 
    max-width: 90%; 
    background: linear-gradient(145deg, rgba(44,32,52,0.98), rgba(25,20,31,0.98)); 
    border: 1px solid rgba(255,255,255,0.1); 
    border-radius: 22px; 
    padding: 30px; 
    box-shadow: 0 25px 80px rgba(0,0,0,0.55); 
    animation: popup 0.25s ease; 
} 
 
@keyframes popup { 
    from { 
        opacity: 0; 
        transform: translateY(15px) scale(0.97); 
    } 
    to { 
        opacity: 1; 
        transform: translateY(0) scale(1); 
    } 
} 
 
.modal-header { 
    display: flex; 
    justify-content: space-between; 
    align-items: center; 
    margin-bottom: 25px; 
} 
 
.modal-header h2 { 
    font-size: 23px; 
} 
 
.close { 
    font-size: 25px; 
    cursor: pointer; 
    color: #aaa; 
} 
 
.close:hover { 
    color: white; 
} 
 
.form-group { 
    margin-bottom: 16px; 
} 
 
.form-group label { 
    display: block; 
    margin-bottom: 7px; 
    font-size: 12px; 
    color: #bcb1c3; 
} 
 
.form-group input, 
.form-group select { 
    width: 100%; 
    padding: 12px 13px; 
    border-radius: 10px; 
    border: 1px solid rgba(255,255,255,0.1); 
    background: rgba(255,255,255,0.06); 
    color: white; 
    outline: none; 
} 
 
.form-group select option { 
    background: #28202f; 
    color: white; 
} 
 
.form-group input:focus, 
.form-group select:focus { 
    border-color: #c47cff; 
    box-shadow: 0 0 0 3px rgba(196,124,255,0.08); 
} 
 
.form-actions { 
    display: flex; 
    justify-content: flex-end; 
    gap: 10px; 
    margin-top: 22px; 
} 
 
.cancel-btn { 
    border: none; 
    cursor: pointer; 
    padding: 11px 18px; 
    border-radius: 10px; 
    background: rgba(255,255,255,0.08); 
    color: #ddd; 
} 
 
.save-btn { 
    border: none; 
    cursor: pointer; 
    padding: 11px 20px; 
    border-radius: 10px; 
    background: linear-gradient(135deg, #dca6ff, #a95cff); 
    color: #201126; 
    font-weight: bold; 
} 
 
@media(max-width: 800px) { 
    .container { 
        padding: 25px 15px; 
    } 
 
    .navbar { 
        padding: 0 18px; 
    } 
 
    .summary-grid { 
        grid-template-columns: 1fr; 
    } 
 
    .page-header { 
        flex-direction: column; 
        align-items: flex-start; 
        gap: 18px; 
    } 
} 
 
</style> 

</head> 

<body> 

<!-- NAVBAR --> 

<div class="navbar"> 

```
<div class="logo-area"> 

    <div class="logo"> 
        S 
    </div> 

    <div class="brand"> 
        Santi<span>Her</span> 
    </div> 

</div> 

<!-- FIXED DASHBOARD LINK --> 
<a href="DashboardServlet" 
   class="dashboard-btn"> 

    ← Dashboard 

</a> 
```

</div> 

<!-- MAIN CONTAINER --> 

<div class="container"> 

```
<!-- PAGE HEADER --> 

<div class="page-header"> 

    <div> 

        <div class="page-title"> 
            Restroom Management 
        </div> 

        <div class="page-subtitle"> 
            Manage campus restrooms and monitor their current status. 
        </div> 

    </div> 

    <button class="add-btn" 
            onclick="openAddForm()"> 

        + Add Restroom 

    </button> 

</div> 

<!-- SUMMARY --> 

<div class="summary-grid"> 

    <% 

    ResultSet rs = 
        (ResultSet) request.getAttribute("restroomResult"); 

    int total = 0; 
    int clean = 0; 
    int attention = 0; 

    if (rs != null) { 

        while (rs.next()) { 

            total++; 

            String status = 
                rs.getString("cleanliness_status"); 

            if ("Clean".equalsIgnoreCase(status)) { 
                clean++; 
            } else { 
                attention++; 
            } 

        } 

    } 

    %> 

    <div class="summary-card"> 

        <div class="summary-label"> 
            Total Restrooms 
        </div> 

        <div class="summary-number"> 
            <%= total %> 
        </div> 

    </div> 

    <div class="summary-card"> 

        <div class="summary-label"> 
            Clean & Ready 
        </div> 

        <div class="summary-number"> 
            <%= clean %> 
        </div> 

    </div> 

    <div class="summary-card"> 

        <div class="summary-label"> 
            Needs Attention 
        </div> 

        <div class="summary-number"> 
            <%= attention %> 
        </div> 

    </div> 

</div> 

<!-- TABLE --> 

<div class="table-card"> 

    <table> 

        <thead> 

            <tr> 
                <th>ID</th> 
                <th>Restroom</th> 
                <th>Block</th> 
                <th>Floor</th> 
                <th>Gender</th> 
                <th>Status</th> 
                <th>Assigned Staff</th> 
                <th>Last Cleaned</th> 
                <th>Action</th> 
            </tr> 

        </thead> 

        <tbody> 

        <% 

        try { 
            rs.beforeFirst(); 
        } catch (Exception e) { 
            // Ignore if ResultSet does not support beforeFirst() 
        } 

        if (rs != null) { 

            while (rs.next()) { 

        %> 

            <tr> 

                <td> 
                    <%= rs.getInt("restroom_id") %> 
                </td> 

                <td> 
                    <strong> 
                        <%= rs.getString("restroom_name") %> 
                    </strong> 
                </td> 

                <td> 
                    <%= rs.getString("block_name") %> 
                </td> 

                <td> 
                    <%= rs.getString("floor_name") %> 
                </td> 

                <td> 
                    <%= rs.getString("gender") %> 
                </td> 

                <td> 

                    <% 

                    String rowStatus = 
                        rs.getString("cleanliness_status"); 

                    if ("Clean".equalsIgnoreCase(rowStatus)) { 

                    %> 

                        <span class="status clean"> 
                            Clean 
                        </span> 

                    <% 

                    } else { 

                    %> 

                        <span class="status attention"> 
                            <%= rowStatus %> 
                        </span> 

                    <% 

                    } 

                    %> 

                </td> 

                <td> 
                    <%= rs.getString("assigned_staff") %> 
                </td> 

                <td> 
                    <%= rs.getString("last_cleaned") %> 
                </td> 

                <td> 

                    <div class="action-area"> 

                        <!-- EDIT --> 

                        <button 
                            type="button" 
                            class="edit-btn" 

                            onclick="openEditForm( 

                                '<%= rs.getInt("restroom_id") %>', 

                                '<%= rs.getString("restroom_name") %>', 

                                '<%= rs.getString("block_name") %>', 

                                '<%= rs.getString("floor_name") %>', 

                                '<%= rs.getString("gender") %>', 

                                '<%= rs.getString("cleanliness_status") %>', 

                                '<%= rs.getString("assigned_staff") %>' 

                            )"> 

                            Edit 

                        </button> 

                        <!-- DELETE --> 

                        <a 
                            href="RestroomServlet?action=delete&id=<%= rs.getInt("restroom_id") %>" 
                            class="delete-btn" 
                            onclick="return confirm('Are you sure you want to delete this restroom?');"> 

                            Delete 

                        </a> 

                    </div> 

                </td> 

            </tr> 

        <% 

            } 

        } 

        %> 

        </tbody> 

    </table> 

</div> 
```

</div> 

<!-- ADD RESTROOM MODAL --> 

<div id="addModal" class="modal"> 

```
<div class="modal-content"> 

    <div class="modal-header"> 

        <h2>Add Restroom</h2> 

        <span class="close" 
              onclick="closeAddForm()"> 
            × 
        </span> 

    </div> 

    <form action="RestroomServlet" method="post"> 

        <div class="form-group"> 

            <label>Restroom Name</label> 

            <input 
                type="text" 
                name="restroom_name" 
                placeholder="Example: Block E Restroom" 
                required> 

        </div> 

        <div class="form-group"> 

            <label>Block Name</label> 

            <input 
                type="text" 
                name="block_name" 
                placeholder="Example: Main Academic Block" 
                required> 

        </div> 

        <div class="form-group"> 

            <label>Floor</label> 

            <input 
                type="text" 
                name="floor_name" 
                placeholder="Example: First Floor" 
                required> 

        </div> 

        <div class="form-group"> 

            <label>Gender</label> 

            <select name="gender" required> 

                <option value=""> 
                    Select Gender 
                </option> 

                <option value="Female"> 
                    Female 
                </option> 

                <option value="Male"> 
                    Male 
                </option> 

                <option value="Unisex"> 
                    Unisex 
                </option> 

            </select> 

        </div> 

        <div class="form-group"> 

            <label>Cleanliness Status</label> 

            <select name="cleanliness_status" required> 

                <option value="Clean"> 
                    Clean 
                </option> 

                <option value="Attention"> 
                    Attention 
                </option> 

                <option value="Needs Cleaning"> 
                    Needs Cleaning 
                </option> 

            </select> 

        </div> 

        <div class="form-group"> 

            <label>Assigned Staff</label> 

            <input 
                type="text" 
                name="assigned_staff" 
                placeholder="Example: Cleaning Team A" 
                required> 

        </div> 

        <div class="form-actions"> 

            <button 
                type="button" 
                class="cancel-btn" 
                onclick="closeAddForm()"> 

                Cancel 

            </button> 

            <button 
                type="submit" 
                class="save-btn"> 

                Add Restroom 

            </button> 

        </div> 

    </form> 

</div> 
```

</div> 

<!-- EDIT RESTROOM MODAL --> 

<div id="editModal" class="modal"> 

```
<div class="modal-content"> 

    <div class="modal-header"> 

        <h2>Edit Restroom</h2> 

        <span class="close" 
              onclick="closeEditForm()"> 
            × 
        </span> 

    </div> 

    <form action="RestroomServlet" method="post"> 

        <input 
            type="hidden" 
            id="edit_restroom_id" 
            name="restroom_id"> 

        <div class="form-group"> 

            <label>Restroom Name</label> 

            <input 
                type="text" 
                id="edit_restroom_name" 
                name="restroom_name" 
                required> 

        </div> 

        <div class="form-group"> 

            <label>Block Name</label> 

            <input 
                type="text" 
                id="edit_block_name" 
                name="block_name" 
                required> 

        </div> 

        <div class="form-group"> 

            <label>Floor</label> 

            <input 
                type="text" 
                id="edit_floor_name" 
                name="floor_name" 
                required> 

        </div> 

        <div class="form-group"> 

            <label>Gender</label> 

            <select 
                id="edit_gender" 
                name="gender" 
                required> 

                <option value="Female">Female</option> 
                <option value="Male">Male</option> 
                <option value="Unisex">Unisex</option> 

            </select> 

        </div> 

        <div class="form-group"> 

            <label>Cleanliness Status</label> 

            <select 
                id="edit_cleanliness_status" 
                name="cleanliness_status" 
                required> 

                <option value="Clean">Clean</option> 
                <option value="Attention">Attention</option> 
                <option value="Needs Cleaning">Needs Cleaning</option> 

            </select> 

        </div> 

        <div class="form-group"> 

            <label>Assigned Staff</label> 

            <input 
                type="text" 
                id="edit_assigned_staff" 
                name="assigned_staff" 
                required> 

        </div> 

        <div class="form-actions"> 

            <button 
                type="button" 
                class="cancel-btn" 
                onclick="closeEditForm()"> 

                Cancel 

            </button> 

            <button 
                type="submit" 
                class="save-btn"> 

                Update Restroom 

            </button> 

        </div> 

    </form> 

</div> 
```

</div> 

<script> 
 
function openAddForm() { 
 
    document.getElementById("addModal").style.display = "flex"; 
 
} 
 
function closeAddForm() { 
 
    document.getElementById("addModal").style.display = "none"; 
 
} 
 
function openEditForm( 
    id, 
    name, 
    block, 
    floor, 
    gender, 
    status, 
    staff 
) { 
 
    document.getElementById("edit_restroom_id").value = id; 
 
    document.getElementById("edit_restroom_name").value = name; 
 
    document.getElementById("edit_block_name").value = block; 
 
    document.getElementById("edit_floor_name").value = floor; 
 
    document.getElementById("edit_gender").value = gender; 
 
    document.getElementById("edit_cleanliness_status").value = status; 
 
    document.getElementById("edit_assigned_staff").value = staff; 
 
    document.getElementById("editModal").style.display = "flex"; 
 
} 
 
function closeEditForm() { 
 
    document.getElementById("editModal").style.display = "none"; 
 
} 
 
window.onclick = function(event) { 
 
    var addModal = document.getElementById("addModal"); 
 
    var editModal = document.getElementById("editModal"); 
 
    if (event.target == addModal) { 
        addModal.style.display = "none"; 
    } 
 
    if (event.target == editModal) { 
        editModal.style.display = "none"; 
    } 
 
}; 
 
</script> 

</body> 

</html>
